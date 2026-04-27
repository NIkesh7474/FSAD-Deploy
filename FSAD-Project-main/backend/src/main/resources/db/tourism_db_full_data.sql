-- Full tourism_db seed for all project data
CREATE DATABASE IF NOT EXISTS `tourism_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tourism_db`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  `email` VARCHAR(255),
  `password` VARCHAR(255),
  `role` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS `homestays` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  `description` TEXT,
  `lat` DOUBLE,
  `lng` DOUBLE,
  `amount` DOUBLE,
  `rooms` INT,
  `category` VARCHAR(255),
  `location` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS `tourist_places` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  `description` TEXT,
  `lat` DOUBLE,
  `lng` DOUBLE,
  `amount` DOUBLE,
  `location` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS `guides` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  `qualification` VARCHAR(255),
  `experience` VARCHAR(255),
  `amount` DOUBLE,
  `contact` VARCHAR(255),
  `location` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `userId` BIGINT,
  `itemId` BIGINT,
  `type` VARCHAR(255),
  `amount` DOUBLE,
  `date` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`name`, `email`, `password`, `role`) VALUES ('Alice Admin', 'admin@test.com', 'password', 'admin');
INSERT INTO `users` (`name`, `email`, `password`, `role`) VALUES ('Bob User', 'user@test.com', 'password', 'user');
INSERT INTO `users` (`name`, `email`, `password`, `role`) VALUES ('Ravi Shankar', 'guide@test.com', 'password', 'guide');

INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Sunset Villa', 'Beautiful view of the valley with high-speed internet.', 34.001, -118.199, 2000, 2, 'double bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Hollywood Hills Retreat', 'Stylish home near the Hollywood Bowl.', 34.002, -118.198, 2200, 3, 'triple bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Venice Beach Loft', 'Modern loft steps from the beach.', 34.003, -118.197, 2400, 1, 'single bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Beverly Hills Oasis', 'Luxury suite with private garden.', 34.004, -118.196, 2600, 2, 'double bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Downtown Sky Suite', 'City view and rooftop access.', 34.005, -118.195, 2800, 3, 'triple bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Westside Coastal Home', 'Bright house minutes from the coast.', 34.006, -118.194, 3000, 1, 'single bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Studio City Bungalow', 'Quiet bungalow near studios.', 34.007, -118.193, 3200, 2, 'double bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Canyon View Residence', 'Private home with canyon views.', 34.008, -118.192, 3400, 3, 'triple bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Santa Monica Hideaway', 'Chic apartment close to Pier.', 34.009, -118.191, 3600, 1, 'single bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Malibu Sunrise Villa', 'Ocean-view villa with sunrise views.', 34.01, -118.19, 3800, 2, 'double bedroom', 'Los Angeles');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Central Park Condo', 'Comfortable Condo steps from Central Park.', 40.701, -73.999, 2000, 2, 'double bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Brooklyn Brownstone', 'Historic home in trendy Brooklyn.', 40.702, -73.998, 2200, 3, 'triple bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('SoHo Artist Loft', 'Spacious loft in SoHo.', 40.703, -73.997, 2400, 1, 'single bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Times Square Studio', 'Bright studio in the heart of Manhattan.', 40.704, -73.996, 2600, 2, 'double bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Hudson River Retreat', 'Riverside apartment with skyline views.', 40.705, -73.995, 2800, 3, 'triple bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Chelsea Terrace Home', 'Elegant home close to galleries.', 40.706, -73.994, 3000, 1, 'single bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Upper East Side Suite', 'Luxury suite near museums.', 40.707, -73.993, 3200, 2, 'double bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Greenwich Village Flat', 'Cozy apartment in the Village.', 40.708, -73.992, 3400, 3, 'triple bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Tribeca Townhouse', 'Stylish townhouse with private patio.', 40.709, -73.991, 3600, 1, 'single bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Battery Park View', 'Waterfront apartment near the Statue of Liberty.', 40.71, -73.99, 3800, 2, 'double bedroom', 'New York');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Eiffel Dream', 'See the tower from your window.', 48.851, 2.341, 2000, 2, 'double bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Montmartre Artist Studio', 'A creative vibe in the heart of Paris.', 48.852, 2.342, 2200, 3, 'triple bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Seine Riverside Apartment', 'Elegant apartment by the river.', 48.853, 2.343, 2400, 1, 'single bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Louvre View Flat', 'Classic Parisian flat near museums.', 48.854, 2.344, 2600, 2, 'double bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Latin Quarter Loft', 'Charming loft in the Latin Quarter.', 48.855, 2.345, 2800, 3, 'triple bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Champs-Ã‰lysÃ©es Suite', 'Upscale suite near the Champs-Ã‰lysÃ©es.', 48.856, 2.346, 3000, 1, 'single bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Saint-Germain Retreat', 'Cozy space in Saint-Germain-des-PrÃ©s.', 48.857, 2.347, 3200, 2, 'double bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Notre-Dame Studio', 'Historic area studio near the cathedral.', 48.858, 2.348, 3400, 3, 'triple bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Le Marais Hideaway', 'Stylish flat in Le Marais.', 48.859, 2.349, 3600, 1, 'single bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Palais-Royal Residence', 'Quiet apartment near Palais-Royal.', 48.86, 2.35, 3800, 2, 'double bedroom', 'Paris');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Marine Drive Sea View', 'Wake up to the sound of waves in Mumbai.', 19.071, 72.881, 2000, 2, 'double bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Bandra Heritage Home', 'Experience classic Mumbai lifestyle.', 19.072, 72.882, 2200, 3, 'triple bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Colaba Colonial House', 'Historic house close to the Gateway of India.', 19.073, 72.883, 2400, 1, 'single bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Juhu Beach Apartment', 'Beachfront stay near Juhu Beach.', 19.074, 72.884, 2600, 2, 'double bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Powai Lake Villa', 'Modern villa overlooking Powai Lake.', 19.075, 72.885, 2800, 3, 'triple bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Andheri Garden Flat', 'Calm apartment near the airport.', 19.076, 72.886, 3000, 1, 'single bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Lower Parel Penthouse', 'Luxury penthouse in the business district.', 19.077, 72.887, 3200, 2, 'double bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Versova Beach Cottage', 'Sea-facing cottage in Versova.', 19.078, 72.888, 3400, 3, 'triple bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Malabar Hill Residence', 'Elegant home with city views.', 19.079, 72.889, 3600, 1, 'single bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Carter Road Retreat', 'Contemporary flat by the promenade.', 19.08, 72.89, 3800, 2, 'double bedroom', 'Mumbai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Marina Beach Retreat', 'Walking distance from the spectacular Marina Beach.', 13.081, 80.271, 2000, 2, 'double bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Mylapore Traditional Stay', 'Immerse in the heritage of Chennai.', 13.082, 80.272, 2200, 3, 'triple bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Besant Nagar Bungalow', 'Spacious home near the bay.', 13.083, 80.273, 2400, 1, 'single bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Egmore Heritage Flat', 'Heritage apartment in a historic neighbourhood.', 13.084, 80.274, 2600, 2, 'double bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('T Nagar Family House', 'Comfortable family-friendly stay.', 13.085, 80.275, 2800, 3, 'triple bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Anna Nagar Garden Home', 'Peaceful home with garden access.', 13.086, 80.276, 3000, 1, 'single bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Velachery Modern Studio', 'Contemporary studio near malls.', 13.087, 80.277, 3200, 2, 'double bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Adyar Riverside Residence', 'Riverside home by the Adyar.', 13.088, 80.278, 3400, 3, 'triple bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Kodaikanal Hills Apartment', 'Cool hillside apartment inside Chennai.', 13.089, 80.279, 3600, 1, 'single bedroom', 'Chennai');
INSERT INTO `homestays` (`name`, `description`, `lat`, `lng`, `amount`, `rooms`, `category`, `location`) VALUES ('Mahabalipuram Coastal Villa', 'Coastal villa with temple views.', 13.09, 80.28, 3800, 2, 'double bedroom', 'Chennai');

INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Hollywood Sign', 'Iconic landmark offering hiking trails.', 34.0015, -118.1985, 1000, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Griffith Observatory', 'Stargazing and city views from the observatory.', 34.003, -118.197, 1100, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Santa Monica Pier', 'Beach boardwalk with shops and rides.', 34.0045, -118.1955, 1200, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Rodeo Drive', 'Luxury shopping and designer boutiques.', 34.006, -118.194, 1300, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Venice Beach Boardwalk', 'Colorful characters and seaside skate park.', 34.0075, -118.1925, 1400, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Getty Center', 'Art museum with gardens and views.', 34.009, -118.191, 1500, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Universal Studios Hollywood', 'Theme park and studio tour experience.', 34.0105, -118.1895, 1600, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('The Broad Museum', 'Contemporary art museum downtown.', 34.012, -118.188, 1700, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Walt Disney Concert Hall', 'Iconic Frank Gehry concert venue.', 34.0135, -118.1865, 1800, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Natural History Museum', 'Dinosaur fossils and cultural exhibits.', 34.015, -118.185, 1900, 'Los Angeles');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Statue of Liberty', 'Historical monument on Ellis Island.', 40.7015, -73.9985, 1000, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Central Park', 'Vast green space for strolling or biking.', 40.703, -73.997, 1100, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Times Square', 'Bright lights and Broadway theatres.', 40.7045, -73.9955, 1200, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Brooklyn Bridge', 'Historic bridge with skyline views.', 40.706, -73.994, 1300, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Metropolitan Museum of Art', 'World-class art collection.', 40.7075, -73.9925, 1400, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Empire State Building', 'Iconic skyscraper observation decks.', 40.709, -73.991, 1500, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('High Line', 'Elevated park built on a former rail line.', 40.7105, -73.9895, 1600, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('One World Observatory', 'Panoramic views from the tallest NYC building.', 40.712, -73.988, 1700, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Rockefeller Center', 'Famous plaza with shops and ice rink.', 40.7135, -73.9865, 1800, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Fifth Avenue', 'High-end shopping and famous landmarks.', 40.715, -73.985, 1900, 'New York');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Eiffel Tower', 'Most-visited paid monument in the world.', 48.8515, 2.3415, 1000, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Louvre Museum', 'World''s largest art museum.', 48.853, 2.343, 1100, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Notre-Dame Cathedral', 'Historic cathedral on the ÃŽle de la CitÃ©.', 48.8545, 2.3445, 1200, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Sacre-CÅ“ur Basilica', 'Hilltop basilica with city views.', 48.856, 2.346, 1300, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Arc de Triomphe', 'Famous monument on the Champs-Ã‰lysÃ©es.', 48.8575, 2.3475, 1400, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('MusÃ©e d''Orsay', 'Impressionist masterpieces in a former station.', 48.859, 2.349, 1500, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Luxembourg Gardens', 'Formal gardens around the Senate palace.', 48.8605, 2.3505, 1600, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Seine River Cruise', 'Scenic city cruise on the Seine.', 48.862, 2.352, 1700, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Palace of Versailles', 'Lavish royal palace just outside Paris.', 48.8635, 2.3535, 1800, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Le Marais', 'Trendy district of galleries and cafes.', 48.865, 2.355, 1900, 'Paris');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Gateway of India', 'Iconic arch monument built in the early 20th century.', 19.0715, 72.8815, 1000, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Siddhivinayak Temple', 'Historic and popular Hindu temple dedicated to Lord Shri Ganesh.', 19.073, 72.883, 1100, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Marine Drive', 'Scenic coastal promenade.', 19.0745, 72.8845, 1200, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Elephanta Caves', 'Ancient rock-cut caves on an island.', 19.076, 72.886, 1300, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Chhatrapati Shivaji Terminus', 'Gothic railway station and UNESCO site.', 19.0775, 72.8875, 1400, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Colaba Causeway', 'Bustling market street for shopping.', 19.079, 72.889, 1500, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Haji Ali Dargah', 'Sea shrine and pilgrimage site.', 19.0805, 72.8905, 1600, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Sanjay Gandhi National Park', 'Urban park with wildlife and caves.', 19.082, 72.892, 1700, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Juhu Beach', 'Popular beach with street food stalls.', 19.0835, 72.8935, 1800, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Bandra Bandstand', 'Waterfront promenade with city skyline views.', 19.085, 72.895, 1900, 'Mumbai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Marina Beach', 'Longest natural urban beach in India.', 13.0815, 80.2715, 1000, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Kapaleeshwarar Temple', 'Stunning Dravidian architecture temple.', 13.083, 80.273, 1100, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Fort St. George', 'Historic fort and museum.', 13.0845, 80.2745, 1200, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('San Thome Basilica', 'Gothic church built over St. Thomas tomb.', 13.086, 80.276, 1300, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Mahabalipuram Temples', 'Ancient rock-cut shore temples.', 13.0875, 80.2775, 1400, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Guindy National Park', 'Small urban wildlife sanctuary.', 13.089, 80.279, 1500, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Elliot''s Beach', 'Calm seaside spot in Besant Nagar.', 13.0905, 80.2805, 1600, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Vivekananda House', 'Museum dedicated to Swami Vivekananda.', 13.092, 80.282, 1700, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Cholamandal Artists'' Village', 'Art colony with galleries.', 13.0935, 80.2835, 1800, 'Chennai');
INSERT INTO `tourist_places` (`name`, `description`, `lat`, `lng`, `amount`, `location`) VALUES ('Kapaleeshwarar Market', 'Vibrant market near the temple.', 13.095, 80.285, 1900, 'Chennai');

INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Ravi Shankar', 'History MA', '5 Years', 1500, '+91-9876543210', 'Mumbai');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Antoine Dupont', 'Tourism Degree', '8 Years', 2200, '+33-612345678', 'Paris');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Meena Iyer', 'Local Heritage Expert', '3 Years', 1200, '+91-9988776655', 'Chennai');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('John Smith', 'Geography BA', '7 Years', 1800, '+1-555-1234', 'Los Angeles');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Maria Garcia', 'Cultural Studies MA', '4 Years', 1600, '+34-612345678', 'Barcelona');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Ahmed Hassan', 'Archaeology PhD', '10 Years', 2500, '+20-123456789', 'Cairo');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Yuki Tanaka', 'Art History MA', '6 Years', 1900, '+81-901234567', 'Tokyo');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Carlos Rodriguez', 'Local Guide Certification', '5 Years', 1400, '+52-551234567', 'Mexico City');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Anna Petrov', 'History BA', '3 Years', 1300, '+7-4951234567', 'Moscow');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('David Wilson', 'Tourism Management', '9 Years', 2100, '+44-2071234567', 'London');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Priya Sharma', 'Cultural Heritage MA', '4 Years', 1500, '+91-9876543211', 'Delhi');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Luca Rossi', 'Art History BA', '6 Years', 1700, '+39-0612345678', 'Rome');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Fatima Al-Zahra', 'Islamic Studies MA', '8 Years', 2000, '+966-501234567', 'Mecca');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Hans Mueller', 'European History PhD', '12 Years', 2800, '+49-3012345678', 'Berlin');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Sofia Dimitriadis', 'Archaeology MA', '5 Years', 1600, '+30-2112345678', 'Athens');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Raj Patel', 'Local Heritage Expert', '7 Years', 1800, '+91-9988776656', 'Ahmedabad');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Isabella Santos', 'Portuguese Culture MA', '4 Years', 1500, '+351-211234567', 'Lisbon');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Mohammed Al-Farsi', 'Middle Eastern Studies', '9 Years', 2200, '+971-501234567', 'Dubai');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Elena Ivanova', 'Russian Literature MA', '6 Years', 1700, '+7-8121234567', 'Saint Petersburg');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('James Brown', 'American History BA', '8 Years', 1900, '+1-212-123-4567', 'New York');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Anjali Gupta', 'Indian History MA', '5 Years', 1600, '+91-9876543212', 'Jaipur');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Pierre Dubois', 'French Culture PhD', '11 Years', 2600, '+33-142345678', 'Paris');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Maria Silva', 'Brazilian Studies MA', '7 Years', 1800, '+55-1123456789', 'Rio de Janeiro');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Ahmed El-Sayed', 'Egyptology PhD', '13 Years', 2900, '+20-223456789', 'Alexandria');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Kim Ji-hoon', 'Korean History MA', '6 Years', 1700, '+82-1023456789', 'Seoul');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Rosa Martinez', 'Latin American Studies', '8 Years', 2000, '+54-1123456789', 'Buenos Aires');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Viktor Petrov', 'Soviet History PhD', '10 Years', 2400, '+7-4952345678', 'Moscow');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Sarah Johnson', 'British History MA', '7 Years', 1850, '+44-1612345678', 'Manchester');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Kavita Singh', 'South Asian Studies', '4 Years', 1450, '+91-9876543213', 'Kolkata');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Marco Bianchi', 'Italian Renaissance MA', '9 Years', 2100, '+39-0551234567', 'Florence');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Layla Al-Rashid', 'Islamic Art History', '6 Years', 1750, '+962-61234567', 'Amman');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Thomas Anderson', 'European Studies BA', '5 Years', 1600, '+46-812345678', 'Stockholm');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Nina Kuznetsova', 'Russian Culture MA', '7 Years', 1800, '+7-3831234567', 'Novosibirsk');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Oliver Thompson', 'Australian History', '8 Years', 1950, '+61-212345678', 'Sydney');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Mei Chen', 'Chinese History PhD', '12 Years', 2700, '+86-1061234567', 'Beijing');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Diego Fernandez', 'Spanish Colonial History', '6 Years', 1700, '+34-912345678', 'Madrid');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Aisha Mohammed', 'African Studies MA', '5 Years', 1550, '+254-712345678', 'Nairobi');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Liam O''Connor', 'Irish History BA', '4 Years', 1400, '+353-11234567', 'Dublin');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Zara Alavi', 'Persian Culture MA', '8 Years', 2000, '+98-2123456789', 'Tehran');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Felix Schneider', 'German History PhD', '11 Years', 2500, '+49-6912345678', 'Frankfurt');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Priyanka Reddy', 'Telugu Culture Expert', '6 Years', 1650, '+91-9876543214', 'Hyderabad');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Giovanni Romano', 'Ancient Roman Studies', '9 Years', 2150, '+39-0698765432', 'Rome');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Nadia Hassan', 'Middle Eastern History', '7 Years', 1850, '+963-11234567', 'Damascus');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Ethan Davis', 'American West History', '8 Years', 1950, '+1-303-123-4567', 'Denver');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Ananya Sharma', 'Hindu Philosophy MA', '5 Years', 1600, '+91-9876543215', 'Varanasi');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Julien Moreau', 'French Revolution Studies', '10 Years', 2300, '+33-143456789', 'Paris');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Carla Mendes', 'Portuguese Exploration', '6 Years', 1700, '+351-221234567', 'Porto');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Omar Al-Saud', 'Saudi Arabian History', '9 Years', 2200, '+966-112345678', 'Riyadh');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Olga Smirnova', 'Russian Imperial History', '7 Years', 1800, '+7-4953456789', 'Saint Petersburg');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('William Taylor', 'Victorian Era Studies', '8 Years', 2000, '+44-1212345678', 'Birmingham');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Deepika Nair', 'Kerala Culture Expert', '4 Years', 1450, '+91-9876543216', 'Kochi');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Alessandro Conti', 'Italian Art History', '11 Years', 2450, '+39-0287654321', 'Milan');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Leila Al-Mansoori', 'Emirati Culture MA', '6 Years', 1750, '+971-212345678', 'Abu Dhabi');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Robert Schmidt', 'Austrian History PhD', '12 Years', 2600, '+43-158765432', 'Vienna');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Maya Patel', 'Gujarati Heritage', '5 Years', 1550, '+91-9876543217', 'Ahmedabad');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Hugo Silva', 'Brazilian History MA', '7 Years', 1850, '+55-2123456789', 'SÃ£o Paulo');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Farah Al-Hussein', 'Iraqi Archaeology', '8 Years', 1950, '+964-11234567', 'Baghdad');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Alexander Petrov', 'Bulgarian History', '6 Years', 1700, '+359-21234567', 'Sofia');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Sophie Martin', 'Canadian History BA', '5 Years', 1600, '+1-416-123-4567', 'Toronto');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Rajesh Kumar', 'South Indian Culture', '9 Years', 2100, '+91-9876543218', 'Bangalore');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Pablo Garcia', 'Spanish Golden Age', '10 Years', 2250, '+34-932345678', 'Barcelona');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Amina Al-Zahra', 'Moroccan Culture MA', '7 Years', 1800, '+212-61234567', 'Marrakech');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Nikolai Ivanov', 'Ukrainian History', '8 Years', 1900, '+380-441234567', 'Kyiv');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Emma Wilson', 'Scottish History MA', '6 Years', 1750, '+44-1312345678', 'Edinburgh');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Sneha Joshi', 'Maharashtrian Culture', '4 Years', 1500, '+91-9876543219', 'Pune');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Roberto Alvarez', 'Latin American History', '9 Years', 2150, '+57-1123456789', 'BogotÃ¡');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Sara Al-Fayed', 'Egyptian Archaeology', '11 Years', 2400, '+20-223456780', 'Luxor');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Daniel Kim', 'Korean Studies PhD', '7 Years', 1850, '+82-223456789', 'Busan');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Isabella Rossi', 'Venetian History', '8 Years', 1950, '+39-0412345678', 'Venice');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Ahmed Al-Mahmoud', 'Kuwaiti Heritage', '6 Years', 1700, '+965-22345678', 'Kuwait City');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Charlotte Dubois', 'French Literature MA', '5 Years', 1650, '+33-153456789', 'Lyon');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Arjun Singh', 'Punjabi Culture Expert', '7 Years', 1800, '+91-9876543220', 'Amritsar');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Miguel Torres', 'Mexican History PhD', '10 Years', 2300, '+52-5551234567', 'Mexico City');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Layla Al-Khalifa', 'Bahraini Culture', '5 Years', 1600, '+973-31234567', 'Manama');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Vladimir Kuznetsov', 'Siberian History', '9 Years', 2050, '+7-3431234567', 'Yekaterinburg');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Grace O''Brien', 'Irish Folklore MA', '6 Years', 1750, '+353-91234567', 'Galway');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Kiran Desai', 'Goan Culture Expert', '4 Years', 1450, '+91-9876543221', 'Goa');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Fernando Silva', 'Portuguese Colonial', '8 Years', 1900, '+351-231234567', 'Lisbon');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Noura Al-Sabah', 'Kuwaiti History', '7 Years', 1800, '+965-51234567', 'Kuwait City');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Maximilian Weber', 'German Philosophy MA', '11 Years', 2350, '+49-2212345678', 'Cologne');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Pooja Agarwal', 'Rajasthani Heritage', '6 Years', 1700, '+91-9876543222', 'Jodhpur');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Antonio Costa', 'Portuguese Empire', '9 Years', 2100, '+351-241234567', 'Lisbon');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Mariam Al-Qasimi', 'Emirati History', '8 Years', 1950, '+971-412345678', 'Sharjah');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Sergei Volkov', 'Russian Revolution Studies', '10 Years', 2250, '+7-4954567890', 'Moscow');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Victoria Thompson', 'British Colonial History', '7 Years', 1850, '+44-1412345678', 'Glasgow');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Ritu Sharma', 'Himalayan Culture', '5 Years', 1650, '+91-9876543223', 'Shimla');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('JosÃ© Martinez', 'Spanish Inquisition', '8 Years', 1950, '+34-952345678', 'Granada');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Huda Al-Otaibi', 'Saudi Culture MA', '6 Years', 1750, '+966-412345678', 'Jeddah');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Dmitri Sokolov', 'Russian Literature PhD', '12 Years', 2500, '+7-8122345678', 'Saint Petersburg');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Megan Roberts', 'Welsh History BA', '5 Years', 1600, '+44-2920123456', 'Cardiff');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Vandana Rao', 'Karnataka Culture', '7 Years', 1800, '+91-9876543224', 'Mysore');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Ricardo Santos', 'Brazilian Amazon', '9 Years', 2100, '+55-9123456789', 'Manaus');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Zainab Al-Hashimi', 'Iraqi History MA', '8 Years', 1900, '+964-51234567', 'Basra');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Tobias Mueller', 'Swiss History PhD', '11 Years', 2400, '+41-441234567', 'Zurich');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Neha Gupta', 'Bengali Culture Expert', '6 Years', 1700, '+91-9876543225', 'Kolkata');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Eduardo Ramirez', 'Colombian History', '7 Years', 1850, '+57-4123456789', 'MedellÃ­n');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Aisha Al-Mahmoud', 'Qatari Heritage', '5 Years', 1650, '+974-31234567', 'Doha');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Igor Petrovich', 'Ukrainian Culture', '8 Years', 1900, '+380-321234567', 'Lviv');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Fiona MacLeod', 'Highland History', '9 Years', 2050, '+44-1413456789', 'Inverness');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Amitabh Singh', 'North Indian Culture', '10 Years', 2200, '+91-9876543226', 'Lucknow');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Gabriela Lopez', 'Peruvian History MA', '6 Years', 1750, '+51-1123456789', 'Cusco');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Omar Al-Rashid', 'Jordanian Archaeology', '8 Years', 1950, '+962-61234568', 'Petra');
INSERT INTO `guides` (`name`, `qualification`, `experience`, `amount`, `contact`, `location`) VALUES ('Natalia Romanova', 'Russian Ballet History', '7 Years', 1800, '+7-4955678901', 'Moscow');
