import os
import texttable
from ingame_rename import check_folder

def parse_contents(query_file, server_cfg):
    # Initialise variables
    vehicles_section = False
    addon_count = 0
    replace_count = 0
    vehicle_list = []
    manufacturer_list = []

    # Open our server.cfg and go through line by line
    with open(server_cfg, 'r') as scfg:
        for line in scfg:
            # We only want everything in the server.cfg after the beginning of the Add On Cars section
            if "Add-On Cars" in line or vehicles_section:
                # Set our boolean to be true so it prints to the end of the file
                vehicles_section = True
                line = line.strip()

                # Bit messy, but this will help determine if it's a car, bike, boat, or ES
                if "Cars" in line:
                    section = "Cars"
                elif "Motorbikes" in line:
                    section = "Motorbikes"
                elif "Boat" in line:
                    section = "Boats"
                elif "Police" in line:
                    section = "Emergency_Services"

                # Trim out commented and blank lines
                if line != "" and not line.startswith("#") and "(non-store)" not in line:
                    # Determine if vehicle is add on or replacement, as the parsing logic will be different
                    # Logic for Replacements
                    if "replaces" in line:
                        # Get ingame and convert to lower case
                        ingame = line.split(" ")[-1].lower()

                        # Let's do some gymnastics to get the real vehicle info
                        split_line = line.split("#")
                        spawn_name = split_line[0].strip("start").strip()
                        real_world = split_line[-1]
                        real_world = real_world.split("replaces")[0].strip()
                        manufacturer = real_world.split(" ")[0]
                        
                        # Aston Martin and John Deere are the only manufacturers without a hypen separating two words
                        # logic to add it in
                        if "Aston" in manufacturer:
                            manufacturer = "Aston_Martin"

                        elif "John" in manufacturer:
                            manufacturer = "John_Deere"

                        query_file.write("(\"%s\", \"%s\",\"10\", \"%s\"),\n" % (real_world, ingame, manufacturer))
                        check_folder(real_world, ingame, manufacturer, section, "Replacements", spawn_name)
                        replace_count+=1
                    
                    # Logic for Add-Ons
                    else:
                        add_split = line.split("#")
                        real_world = add_split[1].strip()
                        ingame = add_split[0].split(" ")[1].strip()
                        manufacturer = real_world.split(" ")[0]

                        # Aston Martin and John Deere are the only manufacturers without a hypen separating two words
                        # logic to add it in
                        if "Aston" in manufacturer:
                            manufacturer = "Aston_Martin"

                        elif "John" in manufacturer:
                            manufacturer = "John_Deere"

                        query_file.write("(\"%s\", \"%s\", \"10\", \"%s\"),\n" % (real_world, ingame, manufacturer))
                        
                        check_folder(real_world, ingame, manufacturer, section, "Add-Ons")
                        addon_count+=1

                    # Add entries to their lists
                    vehicle_list.append(real_world)
                    manufacturer_list.append(manufacturer)
    
    make_count = manufacturer_count(manufacturer_list)

    # Remove duplicates from manufacturer list
    manufacturer_uniq = set(manufacturer_list)
    manufacturer_uniq = sorted(manufacturer_uniq)
    
    # Return everything we need to be used 
    return addon_count, replace_count, vehicle_list, manufacturer_uniq, make_count

def sort_file(car_insert_temp):
    organise = open(car_insert_temp)
    sorted_lines = sorted(organise.readlines())
    organise.close()
    return sorted_lines

def sql_sentences(cisql, manufacturer_uniq):
    cisql.write("USE essentialmode;\n\n")
    cisql.write("-- Add categories to vehicle_categories based on manufacturer if they're not there.\n")

    # We delete every thing from vehicle categories so we don't need to do any sanity checking
    cisql.write("DELETE FROM vehicle_categories;\n\n")    
    for maker in manufacturer_uniq:
        cisql.write("-- %s.\n" % maker)
        cisql.write("INSERT INTO vehicle_categories (name, label) VALUES ('%s', '%s');\n" % (maker, maker))

    cisql.write("\n-- Drop everything from the vehicles table, we'll do a raw insert\n")
    cisql.write("DELETE FROM vehicles;\n\n")

    cisql.write("-- Time to install everything\n")
    cisql.write("INSERT INTO vehicles (name, model, price, category) VALUES\n")

def write_to_file(cisql, car_insert_temp, manufacturer_uniq):
    # Put a little report, Pandas love reports
    cisql.write("-- Add-ons: %s\n-- Replacements: %s\n-- Total: %s\n\n" % (addon_count, replace_count, (addon_count+replace_count)))
    sql_sentences(cisql, manufacturer_uniq)
    sorted_lines = sort_file(car_insert_temp)
    
    line_counter = 1
    for sl in sorted_lines:
        # For the last entry, strip the trailing comma and new line
        if line_counter == len(sorted_lines):
            sl = sl.rstrip('\n')
            cisql.write(sl[:-1])
            
        # We don't want boats or police in the car dealership, although it would be hilarious
        elif "(non-store)" in sl:
            pass

        # Write sorted output to file
        else:
            cisql.write(sl)
        line_counter += 1
    cisql.write(";")

def list_of_vehicles(vehicle_list_file, vehicle_list, make_count):
    # Just as an index, create a list of the available vehicles
    vehicle_list_write = open(vehicle_list_file, "w")

    # Let's draw a pretty table
    table = texttable.Texttable()
    table.add_row(["Make", "Amount"])

    # Print numbers by manufacturer and add to table
    for make,model in make_count.items():
        table.add_row([make, model])
    
    # Print the table with the information to our file
    vehicle_list_write.write(table.draw())
    vehicle_list_write.write("\n\n")

    vehicle_list_write.write("Makes and Models:\n")
    for entry in sorted(vehicle_list):
        vehicle_list_write.write("\t%s\n" %entry)
    vehicle_list_write.close()


def remove_file(car_insert_temp):
    os.remove(car_insert_temp)

def manufacturer_count(manufacturer_list):
    # Create a dictionary to hold our values
    manufacturer_count = {}
    for maker in sorted(manufacturer_list):
        # If Make isn't in the dictionary, add it
        if maker not in manufacturer_count:
            manufacturer_count[maker] = 1
        # Make is already there, increment
        else:
            count = manufacturer_count[maker]
            count+=1
            manufacturer_count[maker] = count
    return manufacturer_count

if __name__ == "__main__":
    # Set absolute paths for files to the folder where this script is
    cwd = os.path.dirname(os.path.realpath(__file__))
    car_insert = cwd+"\\car_insert.sql"
    car_insert_temp = cwd+"\\car_insert.temp"
    server_cfg = cwd+"\\server.cfg"
    vehicle_list_file = cwd+"\\vehicle_list.txt"

    with open(car_insert_temp, "w") as cisqltmp:
        addon_count, replace_count, vechile_list, manufacturer_uniq, make_count = parse_contents(cisqltmp, server_cfg)
     
    with open(car_insert, "w") as cisql:
        write_to_file(cisql, car_insert_temp, manufacturer_uniq)
    
    list_of_vehicles(vehicle_list_file, vechile_list, make_count)
    remove_file(car_insert_temp)