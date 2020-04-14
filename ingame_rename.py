import os
from string import digits
from binascii import hexlify

def check_folder(real_world, ingame, manufacturer, section, add_or_replace, spawn_name=None):
    add_on = False
    # A little gerrymandering to get what we want
    if add_or_replace == "Add-Ons":
        spawn_name = ingame
        add_on = True
    
    # Change this to your folder location
    fx_vehicles = "D:\\FXServer\\server-data\\resources\\[vehicles]\\[%s]\\[%s]\\[%s]\\%s" % (add_or_replace, section, manufacturer, spawn_name)

    # check that the main folder exists
    if os.path.exists(fx_vehicles):
        # set the vehicle_names.lua as a variable for ease
        name_lua = fx_vehicles+"\\vehicle_names.lua"
        resource_lua = fx_vehicles+"\\__resource.lua"

        # Check if the vehicle_names.lua exist..
        if os.path.exists(name_lua):
            pass
        
        # Otherwise,create it and fill it with the necessary data
        else:
            if add_or_replace == "Replacements":
                game_manufacturer = ingame_manufacturer(ingame)
            else:
                game_manufacturer = manufacturer
            
            # Take out hypens or dashes from name
            if game_manufacturer is not None: 
                game_manufacturer = game_manufacturer.replace("_", " ")
                game_manufacturer = game_manufacturer.replace("-", " ")
            else:
                print("Ingame %s returned None" % ingame)

            # Add the necessary text to the vehicle_name.lua
            with open(name_lua, "w") as nl:
                if add_or_replace == "Replacements":
                    nl.write("Citizen.CreateThread(function()\n")
                    nl.write("\tAddTextEntry('%s', '%s')\n" % (ingame, real_world))
                    nl.write("\tAddTextEntry('%s', '')\n" % (game_manufacturer))
                    nl.write("end)\n\n")
                else:
                    pass
                    #nl.write("\tAddTextEntry('%s', '%s')\n" %(real_world, real_world))
                
                
        # Start boolean as False
        name_already_there = False

        with open(resource_lua, "r") as rl:
            for line in rl.readlines():
                if "vehicle_names.lua" in line:
                    name_already_there = True

            # Necessary line hasn't been added to the resource.lua file
            if not name_already_there and add_or_replace == "Replacements":
                resource = open(resource_lua, "a")
                resource.write("client_script{\n")
                resource.write("\t'vehicle_names.lua'\n")
                resource.write("}")
                resource.close()
            else:
                pass

    else:
        print("%s doesn't exist" % fx_vehicles)
        pass

def ingame_manufacturer(ingame):
    ingame_list = {'dinghy': 'nagasaki', 'jetmax': 'shitzu', 'marquis': 'dinka', 'seashark': 'speedophile', \
        'speeder': 'pegassi', 'squalo': 'shitzu', 'suntrap': 'shitzu', 'toro': 'lampadati', 'tropic': 'shitzu', 'tug': 'buckingham', \
        'benson': 'vapid', 'biff': 'hvy', 'hauler': 'jobuilt', "strongnotes:/strong shares the gta iv packer's cab (": 'mtl)br /', 'mule': 'maibatsu',\
        'packer': 'mtl', 'phantom': 'jobuilt', 'phantom wedge': 'jobuilt', 'pounder': 'mtl', 'stockade': 'brute', 'blista': 'dinka', \
        'brioso r/a': 'grotti', 'dilettante': 'karin', 'issi': 'weeny', 'panto': 'benefactor', 'prairie': 'bollokan', 'rhapsody': 'declasse',\
        'cogcabrio': 'enus', 'exemplar': 'dewbauchee', 'f620': 'ocelot', 'felon': 'lampadati', 'felon gt': 'lampadati', 'jackal': 'ocelot',\
        'oracle': 'ubermacht', 'oracle 2': 'ubermacht', 'sentinel': 'ubermacht', 'sentinel xs': 'ubermacht', 'windsor': 'enus', 'windsor drop': 'enus',\
        'zion': 'ubermacht', 'zion cabrio': 'ubermacht', 'ambulance': 'brute', 'fib (buffalo)': 'bravado', 'fib (granger)': 'declasse', 'fire truck': 'mtl',\
        'lifeguard (granger)': 'declasse', 'park ranger (granger)': 'declasse', 'police bike': 'western motorcycle company', 'police cruiser': 'vapid',\
        'police cruiser 2': 'vapid', 'police cruiser (buffalo)': 'bravado', 'police transporter': 'declasse', 'sheriff cruiser': 'vapid', \
        'sheriff suv (granger)': 'declasse', 'unmarked cruiser': 'vapid', 'annihilator': 'western', 'buzzard': 'nagasaki', 'buzzard attack chopper':'nagasaki',\
        'cargobob': 'western', 'frogger': 'maibatsu', 'maverick': 'buckingham', 'police maverick': 'buckingham', 'skylift': 'hvy', \
        'supervolito': 'buckingham', 'swift': 'buckingham', 'valkyrie': 'buckingham', 'volatus': 'buckingham', 'dozer': 'hvy', 'dump': 'brute', 'flatbed': 'mtl',\
        'guardian': 'vapid', 'mixer': 'hvy', 'strongnotes:/strong shares same cab as tipper': 'brutebr /', 'mixer 2': 'hvy', 'rubble': 'jobuilt',\
        'tipper': 'brute', 'strongnotes:/strong shares same cab as mixer': 'hvybr /', 'barracks': 'hvy', 'barracks semi': 'hvy', 'crusader': 'canis',\
        'akuma': 'dinka', 'avarus': 'lcc', 'bagger': 'western motorcycle company', 'bati': 'pegassi', 'bati 801rr': 'pegassi', 'bf400': 'nagasaki',\
        'carbon rs': 'nagasaki', 'chimera': 'nagasaki', 'cliffhanger': 'western motorcycle company', 'daemon': 'western motorcycle company', 'defiler': 'shitzu',\
        'diabolus': 'western motorcycle company', 'diabolus custom': 'western motorcycle company', 'double': 'dinka', 'enduro': 'dinka', 'esskey': 'pegassi',\
        'faggio': 'pegassi', 'faggio mod': 'pegassi', 'faggio sport': 'pegassi', 'fcr 1000': 'pegassi', 'fcr 1000 custom': 'pegassi', 'gargoyle': 'western motorcycle company',\
        'hakuchou': 'shitzu', 'hakuchou drag': 'shitzu', 'hexer': 'lcc', 'innovation': 'lcc', 'lectro': 'principe', 'manchez': 'maibatsu', 'nemesis': 'principe',\
        'nightblade': 'western motorcycle company', 'pcj 600': 'shitzu', 'rat bike': 'western motorcycle company', 'ruffian': 'pegassi', 'sanchez': 'maibatsu',\
        'sanctus': 'lcc', 'shotaro': 'nagasaki', 'sovereign': 'western motorcycle company', 'thrust': 'dinka', 'vader': 'shitzu', 'vindicator': 'dinka',\
        'vortex': 'pegassi', 'wolfsbane': 'western motorcycle company', 'zombie bobber': 'western motorcycle company', 'zombie chopper': 'western motorcycle company',\
        'blade': 'vapid', 'buccaneer': 'albany', 'burger shot stallion': 'classique', 'chino': 'vapid', 'coquette blackfin': 'invetero', 'dominator': 'vapid',\
        "duke o'death": 'imponte', 'dukes': 'imponte', 'faction': 'willard', 'gauntlet': 'bravado', 'hotknife': 'vapid', 'lurcher': 'albany',\
        'moonbeam': 'declasse', 'nightshade': 'imponte', 'phoenix': 'imponte', 'picador': 'cheval', 'pisswasser dominator': 'vapid',\
        'ratloader': 'bravado', 'rat-truck': 'bravado', 'redwood gauntlet': 'bravado', 'ruiner': 'imponte', 'ruiner 2000': 'imponte', 'sabregt': 'declasse',\
        'slamvan/lost slamvan': 'vapid', 'stallion': 'classique', 'tampa': 'declasse', 'vigero': 'declasse', 'virgo': 'albany', 'voodoo': 'declasse', 'bifta': 'bf',\
        'blazer': 'nagasaki', 'blazer aqua': 'nagasaki', "blazer (trevor's custom)": 'nagasaki', 'blazer lifeguard': 'nagasaki', 'bodhi': 'canis',\
        'brawler': 'coil', 'desert raid': 'vapid', 'dubsta 6x6': 'benefactor', 'dune buggy': 'bf', 'duneloader': 'bravado',\
        'injection': 'bf', 'insurgent': 'hvy', 'kalahari': 'canis', 'the liberator': 'vapid', 'marshall': 'cheval', 'mesa 3': 'canis',\
        'ramp buggy': 'bf', 'rancherxl': 'declasse', 'rebel': 'karin', 'sandking': 'vapid', 'sandking xl': 'vapid', 'space docker': 'bf',\
        'street blazer': 'nagasaki', 'technical': 'karin', 'technical aqua': 'karin', 'trophy truck': 'vapid', 'besra': 'western', 'cuban 800': 'western',\
        'dodo': 'mammoth', 'duster': 'western', 'hydra': 'mammoth', 'luxor': 'buckingham', 'mallard': 'western', 'mammatus': 'jobuilt', 'mil-jet': 'buckingham',\
        'nimbus': 'buckingham', 'p-996 lazer': 'jobuilt', 'shamal': 'buckingham', 'velum': 'jobuilt', 'vestra': 'buckingham', 'asea': 'declasse',\
        'asterope': 'karin', 'cognoscenti': 'enus', 'cognoscenti 55': 'enus', 'emperor': 'albany', 'fugitive': 'cheval', 'glendale': 'benefactor',\
        'ingot': 'vulcar', 'intruder': 'karin', 'premier': 'declasse', 'primo': 'albany', 'regina': 'dundreary', 'romero hearse': 'chariot',\
        'schafter': 'benefactor', 'schafter lwb': 'benefactor', 'schafter v12': 'benefactor', 'stanier': 'vapid', 'stratum': 'zirconium', 'stretch': 'dundreary',\
        'superd': 'enus', 'surge': 'cheval', 'tailgater': 'obey', 'stretch e': 'benefactor', 'warrener': 'vulcar', 'washington': 'albany',\
        'airport bus': 'brute', 'brickade': 'hvy', 'bus': 'brute', 'dune': 'mtl', 'rental shuttle bus': 'brute', 'taxi': 'vapid', 'tourbus': 'brute',\
        'wastelander': 'mtl', 'ninef': 'obey', 'ninef cabrio': 'obey', 'alpha': 'albany', 'banshee': 'bravado', 'bestiagts': 'grotti', 'blista compact': 'dinka',\
        'buffalo': 'bravado', 'buffalo s': 'bravado', 'carbonizzare': 'grotti', 'comet': 'pfister', 'comet retro custom': 'pfister', 'coquette': 'invetero',\
        'drift tampa': 'declasse', 'elegy': 'annis', 'elegy rh8': 'annis', 'feltzer': 'benefactor', 'furoregt': 'lampadati', 'fusilade': 'schyster',\
        'futo': 'karin', 'go go monkey blista (compact)': 'dinka', 'jester': 'dinka', 'khamelion': 'hijak', 'kuruma': 'karin', 'lynx': 'ocelot',\
        'massacro': 'dewbauchee', 'omnis': 'obey', 'penumbra': 'maibatsu', 'rapidgt': 'dewbauchee', 'raptor': 'bf', 'schwartzer': 'benefactor',\
        'seven70': 'dewbauchee', 'specter': 'dewbauchee', 'specter custom': 'dewbauchee', 'sprunk buffalo (s)': 'bravado', 'sultan': 'karin',\
        'suranos': 'benefactor', 'tropos': 'lampadati', 'verlierer': 'bravado', 'casco': 'lampadati', 'coquette classic': 'invetero', 'franken stange': 'albany',\
        'jb700': 'dewbauchee', 'mamba': 'declasse', 'manana': 'albany', 'monroe': 'pegassi', 'peyote': 'vapid', 'pigalle': 'lampadati', 'roosevelt': 'albany',\
        'roosevelt valor': 'albany', 'stinger': 'grotti', 'stinger gt': 'grotti', 'stirling gt': 'benefactor', 'tornado': 'declasse', 'tornado rat rod': 'declasse',\
        'ztype': 'truffade', '811': 'pfister', 'adder': 'truffade', 'banshee 900r': 'bravado', 'bullet': 'vapid', 'cheetah': 'grotti', 'entityxf': 'overflod',\
        'etr1': 'emperor', 'fmj': 'vapid', 'infernus': 'pegassi', 'italigtb': 'progen', 'itali gtb custom': 'progen', 'nero': 'truffade', 'nero custom': 'truffade',\
        'osiris': 'pegassi', 'penetrator': 'ocelot','penetratorrt': 'ocelot', 're-7b': 'annis', 'reaper': 'pegassi', 'rocket voltic': 'coil', 'sultanrs': 'karin', 't20': 'progen',\
        'tempesta': 'pegassi', 'turismor': 'grotti', 'tyrus': 'progen', 'vacca': 'pegassi', 'voltic': 'coil', 'prototipo': 'grotti', 'zentorno': 'pegassi',\
        'baller': 'gallivanter', 'baller 2': 'gallivanter', 'baller le': 'gallivanter', 'baller le lwb': 'gallivanter', 'beejay xl': 'karin',\
        'cavalcade': 'albany', 'cavalcade 2': 'albany', 'contender': 'vapid', 'dubsta': 'benefactor', 'fq2': 'fathom', 'granger': 'declasse', 'gresley': 'bravado',\
        'habanero': 'emperor', 'huntley': 'enus', 'landstalker': 'dundreary', 'mesa': 'canis', 'patriot': 'mammoth', 'radius': 'vapid', 'rocoto': 'obey',\
        'seminole': 'canis', 'serrano': 'benefactor', 'xls': 'benefactor', 'fieldmaster': 'stanley', 'forklift': 'hvy', 'ripley': 'hvy', 'sadler': 'vapid',\
        'armored boxville': 'brute', 'bison': 'bravado', 'bobcatxl': 'vapid', 'boxville': 'brute', 'burrito': 'declasse', 'camper': 'brute',\
        'gang burrito': 'declasse', 'journey': 'zirconium', 'minivan': 'vapid', 'paradise': 'bravado', 'pony': 'brute', 'rumpo': 'bravado', 'rumpo custom': 'bravado',\
        'speedo': 'vapid', 'surfer': 'bf', 'taco van': 'brute', 'youga': 'bravado', 'youga classic': 'bravado', 'clown van': 'vapid', 'cutter': 'hvy', 'rubber tired gantry crane': 'hvy',\
        'tractor' : 'stanley' }
    
    if ingame != "jb700" and ingame != "seven70" and ingame != "fq2" and ingame != "f620" and ingame != "t20" and ingame != "bf400":
        ingame = ingame.strip(digits)

    if ingame in ingame_list:
        game_manufacturer = ingame_list[ingame]
        return game_manufacturer #.capitalize()
    
