-- Add-ons: 112
-- Replacements: 178
-- Total: 290

USE essentialmode;

-- Add categories to vehicle_categories based on manufacturer if they're not there.
DELETE FROM vehicle_categories;

-- AC.
INSERT INTO vehicle_categories (name, label) VALUES ('AC', 'AC');
-- AMC.
INSERT INTO vehicle_categories (name, label) VALUES ('AMC', 'AMC');
-- Aston_Martin.
INSERT INTO vehicle_categories (name, label) VALUES ('Aston_Martin', 'Aston_Martin');
-- Audi.
INSERT INTO vehicle_categories (name, label) VALUES ('Audi', 'Audi');
-- BMW.
INSERT INTO vehicle_categories (name, label) VALUES ('BMW', 'BMW');
-- Bentley.
INSERT INTO vehicle_categories (name, label) VALUES ('Bentley', 'Bentley');
-- Bugatti.
INSERT INTO vehicle_categories (name, label) VALUES ('Bugatti', 'Bugatti');
-- Cadillac.
INSERT INTO vehicle_categories (name, label) VALUES ('Cadillac', 'Cadillac');
-- Chevrolet.
INSERT INTO vehicle_categories (name, label) VALUES ('Chevrolet', 'Chevrolet');
-- Chrysler.
INSERT INTO vehicle_categories (name, label) VALUES ('Chrysler', 'Chrysler');
-- Declasse.
INSERT INTO vehicle_categories (name, label) VALUES ('Declasse', 'Declasse');
-- Dodge.
INSERT INTO vehicle_categories (name, label) VALUES ('Dodge', 'Dodge');
-- Ducati.
INSERT INTO vehicle_categories (name, label) VALUES ('Ducati', 'Ducati');
-- Ferrari.
INSERT INTO vehicle_categories (name, label) VALUES ('Ferrari', 'Ferrari');
-- Ford.
INSERT INTO vehicle_categories (name, label) VALUES ('Ford', 'Ford');
-- GMC.
INSERT INTO vehicle_categories (name, label) VALUES ('GMC', 'GMC');
-- Honda.
INSERT INTO vehicle_categories (name, label) VALUES ('Honda', 'Honda');
-- Hoverbike.
INSERT INTO vehicle_categories (name, label) VALUES ('Hoverbike', 'Hoverbike');
-- Hummer.
INSERT INTO vehicle_categories (name, label) VALUES ('Hummer', 'Hummer');
-- Hyundai.
INSERT INTO vehicle_categories (name, label) VALUES ('Hyundai', 'Hyundai');
-- Jaguar.
INSERT INTO vehicle_categories (name, label) VALUES ('Jaguar', 'Jaguar');
-- Jeep.
INSERT INTO vehicle_categories (name, label) VALUES ('Jeep', 'Jeep');
-- John_Deere.
INSERT INTO vehicle_categories (name, label) VALUES ('John_Deere', 'John_Deere');
-- KTM.
INSERT INTO vehicle_categories (name, label) VALUES ('KTM', 'KTM');
-- Kawasaki.
INSERT INTO vehicle_categories (name, label) VALUES ('Kawasaki', 'Kawasaki');
-- Koenigsegg.
INSERT INTO vehicle_categories (name, label) VALUES ('Koenigsegg', 'Koenigsegg');
-- Lamborghini.
INSERT INTO vehicle_categories (name, label) VALUES ('Lamborghini', 'Lamborghini');
-- Lancia.
INSERT INTO vehicle_categories (name, label) VALUES ('Lancia', 'Lancia');
-- Lexus.
INSERT INTO vehicle_categories (name, label) VALUES ('Lexus', 'Lexus');
-- Lincoln.
INSERT INTO vehicle_categories (name, label) VALUES ('Lincoln', 'Lincoln');
-- Maserati.
INSERT INTO vehicle_categories (name, label) VALUES ('Maserati', 'Maserati');
-- Mazda.
INSERT INTO vehicle_categories (name, label) VALUES ('Mazda', 'Mazda');
-- McLaren.
INSERT INTO vehicle_categories (name, label) VALUES ('McLaren', 'McLaren');
-- Mercedes-Benz.
INSERT INTO vehicle_categories (name, label) VALUES ('Mercedes-Benz', 'Mercedes-Benz');
-- Mini.
INSERT INTO vehicle_categories (name, label) VALUES ('Mini', 'Mini');
-- Mitsubishi.
INSERT INTO vehicle_categories (name, label) VALUES ('Mitsubishi', 'Mitsubishi');
-- Morgan.
INSERT INTO vehicle_categories (name, label) VALUES ('Morgan', 'Morgan');
-- Nissan.
INSERT INTO vehicle_categories (name, label) VALUES ('Nissan', 'Nissan');
-- Pagani.
INSERT INTO vehicle_categories (name, label) VALUES ('Pagani', 'Pagani');
-- Pontiac.
INSERT INTO vehicle_categories (name, label) VALUES ('Pontiac', 'Pontiac');
-- Porsche.
INSERT INTO vehicle_categories (name, label) VALUES ('Porsche', 'Porsche');
-- Range-Rover.
INSERT INTO vehicle_categories (name, label) VALUES ('Range-Rover', 'Range-Rover');
-- Reliant.
INSERT INTO vehicle_categories (name, label) VALUES ('Reliant', 'Reliant');
-- Rolls-Royce.
INSERT INTO vehicle_categories (name, label) VALUES ('Rolls-Royce', 'Rolls-Royce');
-- SSC.
INSERT INTO vehicle_categories (name, label) VALUES ('SSC', 'SSC');
-- Smart.
INSERT INTO vehicle_categories (name, label) VALUES ('Smart', 'Smart');
-- Subaru.
INSERT INTO vehicle_categories (name, label) VALUES ('Subaru', 'Subaru');
-- Suzuki.
INSERT INTO vehicle_categories (name, label) VALUES ('Suzuki', 'Suzuki');
-- TVR.
INSERT INTO vehicle_categories (name, label) VALUES ('TVR', 'TVR');
-- Tesla.
INSERT INTO vehicle_categories (name, label) VALUES ('Tesla', 'Tesla');
-- Toyota.
INSERT INTO vehicle_categories (name, label) VALUES ('Toyota', 'Toyota');
-- Vespa.
INSERT INTO vehicle_categories (name, label) VALUES ('Vespa', 'Vespa');
-- Volkswagen.
INSERT INTO vehicle_categories (name, label) VALUES ('Volkswagen', 'Volkswagen');
-- W-Motor.
INSERT INTO vehicle_categories (name, label) VALUES ('W-Motor', 'W-Motor');
-- Yamaha.
INSERT INTO vehicle_categories (name, label) VALUES ('Yamaha', 'Yamaha');

-- Drop everything from the vehicles table, we'll do a raw insert
DELETE FROM vehicles;

-- Time to install everything
INSERT INTO vehicles (name, model, price, category) VALUES
("AC Cobra", "mamba","10", "AC"),
("AMC Javelin Ringbrothers Defiant (1972)", "amcj", "10", "AMC"),
("Aston Martin DB5 Vantage (1965)", "jb700","10", "Aston_Martin"),
("Aston Martin DBS Superleggera (2018)", "massacro","10", "Aston_Martin"),
("Aston Martin One-77 (2012)", "seven70","10", "Aston_Martin"),
("Aston Martin Rapide (2010)", "exemplar","10", "Aston_Martin"),
("Aston Martin V12 Vantage (2009)", "rapidgt","10", "Aston_Martin"),
("Aston Martin Vanquish (2013)", "lynx","10", "Aston_Martin"),
("Aston Martin Vanquish Zagato (2017)", "avz", "10", "Aston_Martin"),
("Aston Martin Vantage (2019)", "specter","10", "Aston_Martin"),
("Aston Martin Vulcan (2016)", "specter2","10", "Aston_Martin"),
("Audi A6 Avant (2019)", "ingot","10", "Audi"),
("Audi R8 Spyder", "ninef2","10", "Audi"),
("Audi R8 V10 (2013)", "ninef","10", "Audi"),
("Audi R8 V10 (2013)", "r8ppi", "10", "Audi"),
("Audi RS7 Sportback", "rs7", "10", "Audi"),
("Audi S8 4.0 TSFI Quattro", "tailgater","10", "Audi"),
("Audi SQ7 (2016)", "landstalker","10", "Audi"),
("BMW 1100R Naked Street Racer", "akuma","10", "BMW"),
("BMW 440i XDrive (2018)", "sentinel","10", "BMW"),
("BMW 760i (e65)", "oracle","10", "BMW"),
("BMW E30 M3 (1991)", "sentinel3","10", "BMW"),
("BMW F82 M4 (2014)", "sentinel2","10", "BMW"),
("BMW M3 GTR E46", "m3gtr", "10", "BMW"),
("BMW M5 F90 (2018)", "bmci", "10", "BMW"),
("BMW M6 Coupe (2013)", "zion","10", "BMW"),
("BMW M6 F13 Shadow Line", "zion2","10", "BMW"),
("BMW M8 Coupé (2020)", "oracle2","10", "BMW"),
("BMW S1000RR (2014)", "bmws", "10", "BMW"),
("BMW X6M (2016)", "x6m", "10", "BMW"),
("BMW i8 (I12) (2015)", "i8", "10", "BMW"),
("Bentley Bentayga", "huntley","10", "Bentley"),
("Bentley Continental GT (2014)", "cogcabrio","10", "Bentley"),
("Bentley Mulsanne Mulliner (2013)", "cognoscenti2","10", "Bentley"),
("Bugatti Chiron", "chiron17", "10", "Bugatti"),
("Bugatti Chiron", "nero","10", "Bugatti"),
("Bugatti Veyron Supersport", "adder","10", "Bugatti"),
("Bugatti Vision GT", "nero2","10", "Bugatti"),
("Cadillac ATS-V Coupe (2016)", "cats", "10", "Cadillac"),
("Cadillac ATS-V Coupe", "alpha","10", "Cadillac"),
("Cadillac DTS Presidental Limo", "cone", "10", "Cadillac"),
("Cadillac Eldorado (1978)", "manana","10", "Cadillac"),
("Cadillac Escalade ESV Platinum (2013)", "cavalcade2","10", "Cadillac"),
("Cadillac Escalade GMT900", "gmt900escalade", "10", "Cadillac"),
("Cadillac Fleetwood Eldorado (1968)", "emperor","10", "Cadillac"),
("Chevrolet Bel Air (1957)", "tornado","10", "Chevrolet"),
("Chevrolet Camaro SS (2020)", "fugitive","10", "Chevrolet"),
("Chevrolet Camaro SS 300 Drag", "camaross", "10", "Chevrolet"),
("Chevrolet Camaro Z28 (1970)", "nightshade","10", "Chevrolet"),
("Chevrolet Camaro ZL1 1LE (2018)", "2018zl1", "10", "Chevrolet"),
("Chevrolet Caprice LS (2013)", "caprice13", "10", "Chevrolet"),
("Chevrolet Caprice Wagon (1989)", "regina","10", "Chevrolet"),
("Chevrolet Chevelle SS (1970)", "sabregt","10", "Chevrolet"),
("Chevrolet Cobalt SS", "premier","10", "Chevrolet"),
("Chevrolet Corvette C1 (1960)", "coquette3","10", "Chevrolet"),
("Chevrolet Corvette C7 Stingray (2014)", "coquette","10", "Chevrolet"),
("Chevrolet Corvette Stingray (1968)", "coquette2","10", "Chevrolet"),
("Chevrolet El Camino SS (1970)", "picador","10", "Chevrolet"),
("Chevrolet Express 3500 (2016)", "moonbeam","10", "Chevrolet"),
("Chevrolet Silverado Lifted", "sandking","10", "Chevrolet"),
("Chevrolet Suburban (2016)", "granger","10", "Chevrolet"),
("Chrysler Crossfire Roadster", "fusilade","10", "Chrysler"),
("Chrysler Pacifica Limited (2017)", "minivan2","10", "Chrysler"),
("Declasse Drift Tampa", "tampa3","10", "Declasse"),
("Declasse Drift Tampa", "tampa4","10", "Declasse"),
("Dodge Bison King-Size", "bisonbutch", "10", "Dodge"),
("Dodge Challenger (2016)", "16challenger", "10", "Dodge"),
("Dodge Challenger (2016)", "gauntlet","10", "Dodge"),
("Dodge Challenger SRT Demon (2018)", "demon", "10", "Dodge"),
("Dodge Charger (2016)", "16charger", "10", "Dodge"),
("Dodge Charger (2016)", "buffalo2","10", "Dodge"),
("Dodge Charger R/T (1969)", "dukes","10", "Dodge"),
("Dodge Charger SRT8 (2012)", "buffalo","10", "Dodge"),
("Dodge Dart Demon (1971)", "tampa","10", "Dodge"),
("Dodge Demonhawk", "dcd", "10", "Dodge"),
("Dodge Gauntlet Custom 6STR", "gauntlet6str", "10", "Dodge"),
("Dodge Ram Limited (2016)", "bison","10", "Dodge"),
("Dodge Viper (2013)", "banshee","10", "Dodge"),
("Dodge Viper SRT", "banshee2","10", "Dodge"),
("Dodge Viper", "viper", "10", "Dodge"),
("Ducati Desmosedici RR", "bati","10", "Ducati"),
("Ducati Diavel", "innovation","10", "Ducati"),
("Ducati GP15", "dgp15", "10", "Ducati"),
("Ducati GP15", "dgp215", "10", "Ducati"),
("Ducati Multistrada", "bf400","10", "Ducati"),
("Ducati Panigale R 1299 (2016)", "panigale", "10", "Ducati"),
("Ducati Panigale V4 Speciale (2018)", "v4s", "10", "Ducati"),
("Ducati Panigale V4 Speciale (2018)", "v4sp", "10", "Ducati"),
("Ducati Panigale v4", "bati2","10", "Ducati"),
("Ferrari 250 GT Berlinetta Lusso (1962)", "casco","10", "Ferrari"),
("Ferrari 458 Italia (2015)", "yFe458i1", "10", "Ferrari"),
("Ferrari 458 Speciale (2015)", "yFe458i2", "10", "Ferrari"),
("Ferrari 458 Speciale Aperta (2015)", "yFe458s2", "10", "Ferrari"),
("Ferrari 458 Speciale Aperta (2015)", "yFe458s2X", "10", "Ferrari"),
("Ferrari 458 Spider (2015)", "yFe458s1", "10", "Ferrari"),
("Ferrari 458 Spider (2015)", "yFe458s1X", "10", "Ferrari"),
("Ferrari 599 GTO", "gto", "10", "Ferrari"),
("Ferrari 599 GTO", "gtonl", "10", "Ferrari"),
("Ferrari 812 Superfast (2018)", "f812", "10", "Ferrari"),
("Ferrari California T (2015)", "carbonizzare","10", "Ferrari"),
("Ferrari Enzo & Gemballa MIG-U1 Tuning", "mig", "10", "Ferrari"),
("Ferrari Enzo", "enzo", "10", "Ferrari"),
("Ferrari F12 Berlinetta (2013)", "f12", "10", "Ferrari"),
("Ferrari F40 (1987)", "ff40", "10", "Ferrari"),
("Ferrari F80 (2016)", "prototipo","10", "Ferrari"),
("Ferrari FXX-K Hybrid", "fxxk", "10", "Ferrari"),
("Ferrari GTC4 Lusso", "bestiagts","10", "Ferrari"),
("Ferrari GTO 599XX", "599gtox", "10", "Ferrari"),
("Ferrari LaFerrari", "turismor","10", "Ferrari"),
("Ferrari Portofino (2018)", "fpino", "10", "Ferrari"),
("Ford Crown Victoria", "stanier","10", "Ford"),
("Ford Crownvic CVPI Retired (2011)", "crownvic", "10", "Ford"),
("Ford Everest", "serrano","10", "Ford"),
("Ford Expedition Platinum Civilian (2018)", "xls","10", "Ford"),
("Ford F-150 Hennessey Velociraptor (2017)", "velociraptor", "10", "Ford"),
("Ford F-250 Super Duty (2020)", "20f250", "10", "Ford"),
("Ford F-350 Dually (2018)", "sadler","10", "Ford"),
("Ford F350 Superduty Lifted (2008)", "sandking2","10", "Ford"),
("Ford Fairlane 500  (1966)", "buccaneer","10", "Ford"),
("Ford Falcon XB GT (Mad Max Interceptor)", "dominator4","10", "Ford"),
("Ford Falcon XB GT 351 (1973)", "blade","10", "Ford"),
("Ford Focus RS (2016)", "blista2","10", "Ford"),
("Ford GT (2017)", "bullet","10", "Ford"),
("Ford GT (2017)", "gt2017", "10", "Ford"),
("Ford GT LM (2019)", "fmj","10", "Ford"),
("Ford LTD Crown Victoria (1987)", "chino","10", "Ford"),
("Ford Mondeo (2016)", "mondeo", "10", "Ford"),
("Ford Mondeo MK4 TitaniumX Station Wagon (2012)", "stratum","10", "Ford"),
("Ford Mustang (1967)", "vigero","10", "Ford"),
("Ford Mustang Cobra (2004)", "mgt", "10", "Ford"),
("Ford Mustang GT500 (2019)", "dominator2","10", "Ford"),
("Ford Mustang Hoonican", "fordh", "10", "Ford"),
("Ford Mustang RTR", "dominator3","10", "Ford"),
("Ford Mustang", "dominator","10", "Ford"),
("Ford Pickup Hotrod (1936) Custom", "ratloader2","10", "Ford"),
("Ford Raptor (2017)", "contender","10", "Ford"),
("Ford Shelby GT500 Eleanor", "eleanor", "10", "Ford"),
("Ford Thunderbird (1957)", "peyote","10", "Ford"),
("Ford Transit (2011)", "moonbeam2","10", "Ford"),
("Ford Tudor Hot Rod (1930)", "hotknife","10", "Ford"),
("GMC Sierra 1500 Crew Cab All Terrain X (2017)", "gmcs", "10", "GMC"),
("GMC Sierra Denali HD3500 (2020)", "20denalihd", "10", "GMC"),
("GMC Yukon Denali (2015)", "gmcyd", "10", "GMC"),
("Honda CBR1000RR (MotoGP)", "honcbr", "10", "Honda"),
("Honda CBR1000RR Fireblade (2010)", "cbr1000", "10", "Honda"),
("Honda CBR1000RR Fireblade (2017)", "hcbr17", "10", "Honda"),
("Honda Goldwing", "bagger","10", "Honda"),
("Honda Integra Type R DC5", "prairie","10", "Honda"),
("Honda Integra Type-R DC1", "dc1r", "10", "Honda"),
("Honda Integra Type-R DC2", "dc2", "10", "Honda"),
("Honda NSX (2015)", "jester","10", "Honda"),
("Honda NSX (NC1) (2016)", "jester2","10", "Honda"),
("Honda Odyssey Elite (2019)", "minivan","10", "Honda"),
("Hoverbike", "ySFbikeA", "10", "Hoverbike"),
("Hummer H2", "patriot","10", "Hummer"),
("Hyundai Sonata (2018)", "intruder","10", "Hyundai"),
("Jaguar C-X75", "cx75", "10", "Jaguar"),
("Jaguar E-type", "stinger","10", "Jaguar"),
("Jaguar F-Type-R SVR", "ftyper", "10", "Jaguar"),
("Jaguar F-pace (2017) hamann edition", "fq2","10", "Jaguar"),
("Jaguar F-type convertible (2014)", "suranos","10", "Jaguar"),
("Jaguar XE SVR Project 8", "felon2","10", "Jaguar"),
("Jaguar XJ (2010)", "felon","10", "Jaguar"),
("Jaguar XJ220", "penetratorrt","10", "Jaguar"),
("Jeep Bagged Custom's Jeep Rock Crawler", "crawler", "10", "Jeep"),
("Jeep Grand Cherokee Trackhawk Series IV (2018)", "seminole","10", "Jeep"),
("Jeep Wrangler Unlimited 3 Door JK (2013)", "mesa3","10", "Jeep"),
("John Deere 6320", "tractor3","10", "John_Deere"),
("KTM RC390", "defiler","10", "KTM"),
("Kawasaki H2 (2016)", "ninjah2", "10", "Kawasaki"),
("Kawasaki Z1000 (1980's)", "kza1000", "10", "Kawasaki"),
("Kawasaki Z1000", "kz1000", "10", "Kawasaki"),
("Kawasaki Z800", "kz800", "10", "Kawasaki"),
("Kawasaki ZX10-R (2014)", "zx10r", "10", "Kawasaki"),
("Kawasaki ZX10R", "double","10", "Kawasaki"),
("Koenigsegg Agera RS Carbon", "agerarsc", "10", "Koenigsegg"),
("Koenigsegg Agera RS", "agerars", "10", "Koenigsegg"),
("Koenigsegg Jesko (2020)", "entityxf","10", "Koenigsegg"),
("Koenigsegg Jesko (2020)", "jes", "10", "Koenigsegg"),
("Lamborghini Aventador LP700-4 (2015)", "tempesta","10", "Lamborghini"),
("Lamborghini Centenario (2017)", "infernus","10", "Lamborghini"),
("Lamborghini Centenario (2017)", "lp770", "10", "Lamborghini"),
("Lamborghini Huracan LP610-4 (2014)", "lp610", "10", "Lamborghini"),
("Lamborghini Huracan LP610-4 (2014)", "vacca","10", "Lamborghini"),
("Lamborghini Miura P400 (1967)", "monroe","10", "Lamborghini"),
("Lamborghini SC18 Alston (2019)", "zentorno","10", "Lamborghini"),
("Lamborghini Urus (2018)", "gresley","10", "Lamborghini"),
("Lancia Delta Integral Evo1", "omnis","10", "Lancia"),
("Lancia Stratos Gr. 4", "tropos","10", "Lancia"),
("Lexus GS F (2019)", "gsf", "10", "Lexus"),
("Lexus LX 570 (2016)", "habanero","10", "Lexus"),
("Lincoln continental (2016)", "washington","10", "Lincoln"),
("Maserati GT", "f620","10", "Maserati"),
("Maserati GT", "furoregt","10", "Maserati"),
("Mazda 3 (2009)", "mz3", "10", "Mazda"),
("Mazda RX7 Veilside", "fnfrx7", "10", "Mazda"),
("Mazda RX7", "rx7", "10", "Mazda"),
("McLaren 570S (2015)", "italigtb","10", "McLaren"),
("McLaren 570s Vorsteiner (2017)", "italigtb2","10", "McLaren"),
("McLaren 675LT (2016)", "675lt", "10", "McLaren"),
("McLaren F1 GTR Longtail", "tyrus","10", "McLaren"),
("McLaren P1", "cheetah","10", "McLaren"),
("Mercedes-Benz 300SL Gullwing (1955)", "feltzer3","10", "Mercedes-Benz"),
("Mercedes-Benz 350 SL Roadster", "glendale","10", "Mercedes-Benz"),
("Mercedes-Benz AMG GT S Prior Edition", "amggtsprior", "10", "Mercedes-Benz"),
("Mercedes-Benz Brabus 700 4.0 (6x6)(L.S.I)", "dubsta3","10", "Mercedes-Benz"),
("Mercedes-Benz C-Class W205 (2014)", "schafter2","10", "Mercedes-Benz"),
("Mercedes-Benz C63 S AMG (2017)", "schafter3","10", "Mercedes-Benz"),
("Mercedes-Benz G-Class (2019)", "dubsta","10", "Mercedes-Benz"),
("Mercedes-Benz G-Class 65 AMG", "gclas9", "10", "Mercedes-Benz"),
("Mercedes-Benz GLS 63 AMG (X166) (2016)", "dubsta2","10", "Mercedes-Benz"),
("Mercedes-Benz Maybach S650 AB (2018)", "schafter4","10", "Mercedes-Benz"),
("Mercedes-Benz S500 W222 v2.2 by Gta5KoRn", "s500w222", "10", "Mercedes-Benz"),
("Mercedes-Benz S63 AMG Cabriolet", "mers63c", "10", "Mercedes-Benz"),
("Mercedes-Benz SLS AMG Black Series (2013)", "feltzer2","10", "Mercedes-Benz"),
("Mercedes-Benz SLS AMG C197 (2011)", "khamelion","10", "Mercedes-Benz"),
("Mini John Cooper Works", "issi2","10", "Mini"),
("Mitsubishi Eclipse (2006)", "penumbra","10", "Mitsubishi"),
("Mitsubishi Eclipse", "fnfmits", "10", "Mitsubishi"),
("Mitsubishi GTS Spider", "2f2fgts", "10", "Mitsubishi"),
("Mitsubishi Lancer Evo VIII", "2f2fmle7", "10", "Mitsubishi"),
("Mitsubishi Lancer Evolution IX MR", "kuruma","10", "Mitsubishi"),
("Morgan Aero SuperSports (2010)", "ztype","10", "Morgan"),
("Nissan Armada Nismo", "tulenis", "10", "Nissan"),
("Nissan Fairlady 240Z", "warrener","10", "Nissan"),
("Nissan GTR (R35)", "elegy2","10", "Nissan"),
("Nissan Patrol Super Safari VTC 4800 Y61 (2016)", "patrolsafari", "10", "Nissan"),
("Nissan Sentra Nismo (2018)", "jackal","10", "Nissan"),
("Nissan Skyline GT-R (R34)", "fnf4r34", "10", "Nissan"),
("Nissan Skyline R34 (2F2F)", "2f2fskyline", "10", "Nissan"),
("Nissan Titan Warrior", "bobcatxl","10", "Nissan"),
("Pagani Huayra BC (2016)", "osiris","10", "Pagani"),
("Pagani Zonda R", "t20","10", "Pagani"),
("Pontiac Firebird (1970)", "phoenix","10", "Pontiac"),
("Pontiac Firebird Trans Am (1977)", "ruiner","10", "Pontiac"),
("Pontiac Knight Rider Kitt", "ruiner2","10", "Pontiac"),
("Porsche 911 (993) RWB Rotana (1993)", "911rwb", "10", "Porsche"),
("Porsche 911 993 GT-2 (1992) RWB", "comet3","10", "Porsche"),
("Porsche 911 Cabriolet Carrera 4S (2020)", "por4s", "10", "Porsche"),
("Porsche 911 GT3 RS (2019)", "comet4","10", "Porsche"),
("Porsche 911 Turbo S (2016)", "comet5","10", "Porsche"),
("Porsche Cayenne S (2018)", "rocoto","10", "Porsche"),
("Porsche Cayenne Turbo S (2016)", "cayenne", "10", "Porsche"),
("Porsche Cayman GT4 (2016)", "comet2","10", "Porsche"),
("Porsche Panamera Techart", "techart17", "10", "Porsche"),
("Range-Rover Autobiography KAHN DESIGN", "baller6","10", "Range-Rover"),
("Range-Rover Sport SVR 5.0 V8 (2014)", "baller","10", "Range-Rover"),
("Range-Rover Velar (2018)", "baller2","10", "Range-Rover"),
("Range-Rover Vogue AB (2015)", "baller5","10", "Range-Rover"),
("Range-Rover Vogue StarTech L405", "baller4","10", "Range-Rover"),
("Range-Rover Vogue Startech", "baller3","10", "Range-Rover"),
("Reliant Robin", "robin", "10", "Reliant"),
("Rolls-Royce Cullinan (2019)", "rculi", "10", "Rolls-Royce"),
("Rolls-Royce Dawn (2019)", "dawn", "10", "Rolls-Royce"),
("Rolls-Royce Ghost (2018)", "windsor2","10", "Rolls-Royce"),
("Rolls-Royce Phantom (2018)", "superd","10", "Rolls-Royce"),
("Rolls-Royce Wraith", "windsor","10", "Rolls-Royce"),
("SSC Ultimate Aero", "ssc", "10", "SSC"),
("Smart For Two", "panto","10", "Smart"),
("Subaru Imprezza WRX STI", "ff4wrx", "10", "Subaru"),
("Subaru Imprezza WRX STi", "sultan","10", "Subaru"),
("Subaru WRX STI (2016)", "sultanrs","10", "Subaru"),
("Subaru WRX STi (2008)", "subisti08", "10", "Subaru"),
("Suzuki GSX-R1000", "gsxr", "10", "Suzuki"),
("Suzuki GSX-R1300 Hayabusa (2015)", "hayabusa", "10", "Suzuki"),
("Suzuki GSX-R1300 Hayabusa drag", "hakuchou2","10", "Suzuki"),
("Suzuki GSX-R1300 Hayabusa", "hakuchou","10", "Suzuki"),
("TVR Griffith (2018)", "verlierer2","10", "TVR"),
("Tesla Model 3 (2018)", "voltic","10", "Tesla"),
("Tesla Roadster (2020)", "surge","10", "Tesla"),
("Toyota Camry XSE (2018)", "asterope","10", "Toyota"),
("Toyota Hilux Vigo (2015)", "rancherxl","10", "Toyota"),
("Toyota Land Cruiser VXR (2016)", "cavalcade","10", "Toyota"),
("Toyota Sprinter Trueno GT Apex (1985)", "futo","10", "Toyota"),
("Toyota Supra A90 Pandem Kit (2020)", "pandema90", "10", "Toyota"),
("Toyota Supra JAZ80 Paul's Car", "fnfmk4", "10", "Toyota"),
("Toyota Supra JAZ80", "2f2fmk4", "10", "Toyota"),
("Toyota Supra JZA80", "supra2", "10", "Toyota"),
("Toyota Yaris (2017)", "asea","10", "Toyota"),
("Vespa", "faggio2","10", "Vespa"),
("Volkswagen Beetle (Fusca) Turbo (2012)", "fusca", "10", "Volkswagen"),
("Volkswagen Golf GTI", "blista","10", "Volkswagen"),
("Volkswagen Golf Mk1 'Rabbit'", "rhapsody","10", "Volkswagen"),
("Volkswagen Golf R32", "golfr32", "10", "Volkswagen"),
("Volkswagen Passat Highline Stanced B8 (2016)", "vwstance", "10", "Volkswagen"),
("Volkswagen Transporter (1968)", "surfer","10", "Volkswagen"),
("W-Motor Lykan HyperSport", "reaper","10", "W-Motor"),
("Yamaha R1 (2015)", "yr15", "10", "Yamaha"),
("Yamaha YZF-R1/R1M (2014)", "r1", "10", "Yamaha"),
("Yamaha YZF-R6 (2015)", "yzfr6", "10", "Yamaha");