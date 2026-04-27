package com.tourism.config;

import java.util.Arrays;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.tourism.model.Homestay;
import com.tourism.model.TouristPlace;
import com.tourism.model.Guide;
import com.tourism.model.User;
import com.tourism.repository.HomestayRepository;
import com.tourism.repository.TouristPlaceRepository;
import com.tourism.repository.GuideRepository;
import com.tourism.repository.UserRepository;

@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner initDatabase(HomestayRepository homestayRepo,
                                   TouristPlaceRepository placeRepo,
                                   GuideRepository guideRepo,
                                   UserRepository userRepo) {
        return args -> {
            if (homestayRepo.count() == 0) {
                List<Homestay> homestays = Arrays.asList(
            createHomestay("Sunset Villa", "Beautiful view of the valley with high-speed internet.", 34.0010, -118.1990, 2000.0, 2, "double bedroom", "Los Angeles"),
            createHomestay("Hollywood Hills Retreat", "Stylish home near the Hollywood Bowl.", 34.0020, -118.1980, 2200.0, 3, "triple bedroom", "Los Angeles"),
            createHomestay("Venice Beach Loft", "Modern loft steps from the beach.", 34.0030, -118.1970, 2400.0, 1, "single bedroom", "Los Angeles"),
            createHomestay("Beverly Hills Oasis", "Luxury suite with private garden.", 34.0040, -118.1960, 2600.0, 2, "double bedroom", "Los Angeles"),
            createHomestay("Downtown Sky Suite", "City view and rooftop access.", 34.0050, -118.1950, 2800.0, 3, "triple bedroom", "Los Angeles"),
            createHomestay("Westside Coastal Home", "Bright house minutes from the coast.", 34.0060, -118.1940, 3000.0, 1, "single bedroom", "Los Angeles"),
            createHomestay("Studio City Bungalow", "Quiet bungalow near studios.", 34.0070, -118.1930, 3200.0, 2, "double bedroom", "Los Angeles"),
            createHomestay("Canyon View Residence", "Private home with canyon views.", 34.0080, -118.1920, 3400.0, 3, "triple bedroom", "Los Angeles"),
            createHomestay("Santa Monica Hideaway", "Chic apartment close to Pier.", 34.0090, -118.1910, 3600.0, 1, "single bedroom", "Los Angeles"),
            createHomestay("Malibu Sunrise Villa", "Ocean-view villa with sunrise views.", 34.0100, -118.1900, 3800.0, 2, "double bedroom", "Los Angeles"),
            createHomestay("Central Park Condo", "Comfortable Condo steps from Central Park.", 40.7010, -73.9990, 2000.0, 2, "double bedroom", "New York"),
            createHomestay("Brooklyn Brownstone", "Historic home in trendy Brooklyn.", 40.7020, -73.9980, 2200.0, 3, "triple bedroom", "New York"),
            createHomestay("SoHo Artist Loft", "Spacious loft in SoHo.", 40.7030, -73.9970, 2400.0, 1, "single bedroom", "New York"),
            createHomestay("Times Square Studio", "Bright studio in the heart of Manhattan.", 40.7040, -73.9960, 2600.0, 2, "double bedroom", "New York"),
            createHomestay("Hudson River Retreat", "Riverside apartment with skyline views.", 40.7050, -73.9950, 2800.0, 3, "triple bedroom", "New York"),
            createHomestay("Chelsea Terrace Home", "Elegant home close to galleries.", 40.7060, -73.9940, 3000.0, 1, "single bedroom", "New York"),
            createHomestay("Upper East Side Suite", "Luxury suite near museums.", 40.7070, -73.9930, 3200.0, 2, "double bedroom", "New York"),
            createHomestay("Greenwich Village Flat", "Cozy apartment in the Village.", 40.7080, -73.9920, 3400.0, 3, "triple bedroom", "New York"),
            createHomestay("Tribeca Townhouse", "Stylish townhouse with private patio.", 40.7090, -73.9910, 3600.0, 1, "single bedroom", "New York"),
            createHomestay("Battery Park View", "Waterfront apartment near the Statue of Liberty.", 40.7100, -73.9900, 3800.0, 2, "double bedroom", "New York"),
            createHomestay("Eiffel Dream", "See the tower from your window.", 48.8510, 2.3410, 2000.0, 2, "double bedroom", "Paris"),
            createHomestay("Montmartre Artist Studio", "A creative vibe in the heart of Paris.", 48.8520, 2.3420, 2200.0, 3, "triple bedroom", "Paris"),
            createHomestay("Seine Riverside Apartment", "Elegant apartment by the river.", 48.8530, 2.3430, 2400.0, 1, "single bedroom", "Paris"),
            createHomestay("Louvre View Flat", "Classic Parisian flat near museums.", 48.8540, 2.3440, 2600.0, 2, "double bedroom", "Paris"),
            createHomestay("Latin Quarter Loft", "Charming loft in the Latin Quarter.", 48.8550, 2.3450, 2800.0, 3, "triple bedroom", "Paris"),
            createHomestay("Champs-Élysées Suite", "Upscale suite near the Champs-Élysées.", 48.8560, 2.3460, 3000.0, 1, "single bedroom", "Paris"),
            createHomestay("Saint-Germain Retreat", "Cozy space in Saint-Germain-des-Prés.", 48.8570, 2.3470, 3200.0, 2, "double bedroom", "Paris"),
            createHomestay("Notre-Dame Studio", "Historic area studio near the cathedral.", 48.8580, 2.3480, 3400.0, 3, "triple bedroom", "Paris"),
            createHomestay("Le Marais Hideaway", "Stylish flat in Le Marais.", 48.8590, 2.3490, 3600.0, 1, "single bedroom", "Paris"),
            createHomestay("Palais-Royal Residence", "Quiet apartment near Palais-Royal.", 48.8600, 2.3500, 3800.0, 2, "double bedroom", "Paris"),
            createHomestay("Marine Drive Sea View", "Wake up to the sound of waves in Mumbai.", 19.0710, 72.8810, 2000.0, 2, "double bedroom", "Mumbai"),
            createHomestay("Bandra Heritage Home", "Experience classic Mumbai lifestyle.", 19.0720, 72.8820, 2200.0, 3, "triple bedroom", "Mumbai"),
            createHomestay("Colaba Colonial House", "Historic house close to the Gateway of India.", 19.0730, 72.8830, 2400.0, 1, "single bedroom", "Mumbai"),
            createHomestay("Juhu Beach Apartment", "Beachfront stay near Juhu Beach.", 19.0740, 72.8840, 2600.0, 2, "double bedroom", "Mumbai"),
            createHomestay("Powai Lake Villa", "Modern villa overlooking Powai Lake.", 19.0750, 72.8850, 2800.0, 3, "triple bedroom", "Mumbai"),
            createHomestay("Andheri Garden Flat", "Calm apartment near the airport.", 19.0760, 72.8860, 3000.0, 1, "single bedroom", "Mumbai"),
            createHomestay("Lower Parel Penthouse", "Luxury penthouse in the business district.", 19.0770, 72.8870, 3200.0, 2, "double bedroom", "Mumbai"),
            createHomestay("Versova Beach Cottage", "Sea-facing cottage in Versova.", 19.0780, 72.8880, 3400.0, 3, "triple bedroom", "Mumbai"),
            createHomestay("Malabar Hill Residence", "Elegant home with city views.", 19.0790, 72.8890, 3600.0, 1, "single bedroom", "Mumbai"),
            createHomestay("Carter Road Retreat", "Contemporary flat by the promenade.", 19.0800, 72.8900, 3800.0, 2, "double bedroom", "Mumbai"),
            createHomestay("Marina Beach Retreat", "Walking distance from the spectacular Marina Beach.", 13.0810, 80.2710, 2000.0, 2, "double bedroom", "Chennai"),
            createHomestay("Mylapore Traditional Stay", "Immerse in the heritage of Chennai.", 13.0820, 80.2720, 2200.0, 3, "triple bedroom", "Chennai"),
            createHomestay("Besant Nagar Bungalow", "Spacious home near the bay.", 13.0830, 80.2730, 2400.0, 1, "single bedroom", "Chennai"),
            createHomestay("Egmore Heritage Flat", "Heritage apartment in a historic neighbourhood.", 13.0840, 80.2740, 2600.0, 2, "double bedroom", "Chennai"),
            createHomestay("T Nagar Family House", "Comfortable family-friendly stay.", 13.0850, 80.2750, 2800.0, 3, "triple bedroom", "Chennai"),
            createHomestay("Anna Nagar Garden Home", "Peaceful home with garden access.", 13.0860, 80.2760, 3000.0, 1, "single bedroom", "Chennai"),
            createHomestay("Velachery Modern Studio", "Contemporary studio near malls.", 13.0870, 80.2770, 3200.0, 2, "double bedroom", "Chennai"),
            createHomestay("Adyar Riverside Residence", "Riverside home by the Adyar.", 13.0880, 80.2780, 3400.0, 3, "triple bedroom", "Chennai"),
            createHomestay("Kodaikanal Hills Apartment", "Cool hillside apartment inside Chennai.", 13.0890, 80.2790, 3600.0, 1, "single bedroom", "Chennai"),
            createHomestay("Mahabalipuram Coastal Villa", "Coastal villa with temple views.", 13.0900, 80.2800, 3800.0, 2, "double bedroom", "Chennai")
                );
                homestayRepo.saveAll(homestays);

                List<TouristPlace> places = Arrays.asList(
            createTouristPlace("Hollywood Sign", "Iconic landmark offering hiking trails.", 34.0015, -118.1985, 1000.0, "Los Angeles"),
            createTouristPlace("Griffith Observatory", "Stargazing and city views from the observatory.", 34.0030, -118.1970, 1100.0, "Los Angeles"),
            createTouristPlace("Santa Monica Pier", "Beach boardwalk with shops and rides.", 34.0045, -118.1955, 1200.0, "Los Angeles"),
            createTouristPlace("Rodeo Drive", "Luxury shopping and designer boutiques.", 34.0060, -118.1940, 1300.0, "Los Angeles"),
            createTouristPlace("Venice Beach Boardwalk", "Colorful characters and seaside skate park.", 34.0075, -118.1925, 1400.0, "Los Angeles"),
            createTouristPlace("Getty Center", "Art museum with gardens and views.", 34.0090, -118.1910, 1500.0, "Los Angeles"),
            createTouristPlace("Universal Studios Hollywood", "Theme park and studio tour experience.", 34.0105, -118.1895, 1600.0, "Los Angeles"),
            createTouristPlace("The Broad Museum", "Contemporary art museum downtown.", 34.0120, -118.1880, 1700.0, "Los Angeles"),
            createTouristPlace("Walt Disney Concert Hall", "Iconic Frank Gehry concert venue.", 34.0135, -118.1865, 1800.0, "Los Angeles"),
            createTouristPlace("Natural History Museum", "Dinosaur fossils and cultural exhibits.", 34.0150, -118.1850, 1900.0, "Los Angeles"),
            createTouristPlace("Statue of Liberty", "Historical monument on Ellis Island.", 40.7015, -73.9985, 1000.0, "New York"),
            createTouristPlace("Central Park", "Vast green space for strolling or biking.", 40.7030, -73.9970, 1100.0, "New York"),
            createTouristPlace("Times Square", "Bright lights and Broadway theatres.", 40.7045, -73.9955, 1200.0, "New York"),
            createTouristPlace("Brooklyn Bridge", "Historic bridge with skyline views.", 40.7060, -73.9940, 1300.0, "New York"),
            createTouristPlace("Metropolitan Museum of Art", "World-class art collection.", 40.7075, -73.9925, 1400.0, "New York"),
            createTouristPlace("Empire State Building", "Iconic skyscraper observation decks.", 40.7090, -73.9910, 1500.0, "New York"),
            createTouristPlace("High Line", "Elevated park built on a former rail line.", 40.7105, -73.9895, 1600.0, "New York"),
            createTouristPlace("One World Observatory", "Panoramic views from the tallest NYC building.", 40.7120, -73.9880, 1700.0, "New York"),
            createTouristPlace("Rockefeller Center", "Famous plaza with shops and ice rink.", 40.7135, -73.9865, 1800.0, "New York"),
            createTouristPlace("Fifth Avenue", "High-end shopping and famous landmarks.", 40.7150, -73.9850, 1900.0, "New York"),
            createTouristPlace("Eiffel Tower", "Most-visited paid monument in the world.", 48.8515, 2.3415, 1000.0, "Paris"),
            createTouristPlace("Louvre Museum", "World's largest art museum.", 48.8530, 2.3430, 1100.0, "Paris"),
            createTouristPlace("Notre-Dame Cathedral", "Historic cathedral on the Île de la Cité.", 48.8545, 2.3445, 1200.0, "Paris"),
            createTouristPlace("Sacre-Cœur Basilica", "Hilltop basilica with city views.", 48.8560, 2.3460, 1300.0, "Paris"),
            createTouristPlace("Arc de Triomphe", "Famous monument on the Champs-Élysées.", 48.8575, 2.3475, 1400.0, "Paris"),
            createTouristPlace("Musée d'Orsay", "Impressionist masterpieces in a former station.", 48.8590, 2.3490, 1500.0, "Paris"),
            createTouristPlace("Luxembourg Gardens", "Formal gardens around the Senate palace.", 48.8605, 2.3505, 1600.0, "Paris"),
            createTouristPlace("Seine River Cruise", "Scenic city cruise on the Seine.", 48.8620, 2.3520, 1700.0, "Paris"),
            createTouristPlace("Palace of Versailles", "Lavish royal palace just outside Paris.", 48.8635, 2.3535, 1800.0, "Paris"),
            createTouristPlace("Le Marais", "Trendy district of galleries and cafes.", 48.8650, 2.3550, 1900.0, "Paris"),
            createTouristPlace("Gateway of India", "Iconic arch monument built in the early 20th century.", 19.0715, 72.8815, 1000.0, "Mumbai"),
            createTouristPlace("Siddhivinayak Temple", "Historic and popular Hindu temple dedicated to Lord Shri Ganesh.", 19.0730, 72.8830, 1100.0, "Mumbai"),
            createTouristPlace("Marine Drive", "Scenic coastal promenade.", 19.0745, 72.8845, 1200.0, "Mumbai"),
            createTouristPlace("Elephanta Caves", "Ancient rock-cut caves on an island.", 19.0760, 72.8860, 1300.0, "Mumbai"),
            createTouristPlace("Chhatrapati Shivaji Terminus", "Gothic railway station and UNESCO site.", 19.0775, 72.8875, 1400.0, "Mumbai"),
            createTouristPlace("Colaba Causeway", "Bustling market street for shopping.", 19.0790, 72.8890, 1500.0, "Mumbai"),
            createTouristPlace("Haji Ali Dargah", "Sea shrine and pilgrimage site.", 19.0805, 72.8905, 1600.0, "Mumbai"),
            createTouristPlace("Sanjay Gandhi National Park", "Urban park with wildlife and caves.", 19.0820, 72.8920, 1700.0, "Mumbai"),
            createTouristPlace("Juhu Beach", "Popular beach with street food stalls.", 19.0835, 72.8935, 1800.0, "Mumbai"),
            createTouristPlace("Bandra Bandstand", "Waterfront promenade with city skyline views.", 19.0850, 72.8950, 1900.0, "Mumbai"),
            createTouristPlace("Marina Beach", "Longest natural urban beach in India.", 13.0815, 80.2715, 1000.0, "Chennai"),
            createTouristPlace("Kapaleeshwarar Temple", "Stunning Dravidian architecture temple.", 13.0830, 80.2730, 1100.0, "Chennai"),
            createTouristPlace("Fort St. George", "Historic fort and museum.", 13.0845, 80.2745, 1200.0, "Chennai"),
            createTouristPlace("San Thome Basilica", "Gothic church built over St. Thomas tomb.", 13.0860, 80.2760, 1300.0, "Chennai"),
            createTouristPlace("Mahabalipuram Temples", "Ancient rock-cut shore temples.", 13.0875, 80.2775, 1400.0, "Chennai"),
            createTouristPlace("Guindy National Park", "Small urban wildlife sanctuary.", 13.0890, 80.2790, 1500.0, "Chennai"),
            createTouristPlace("Elliot's Beach", "Calm seaside spot in Besant Nagar.", 13.0905, 80.2805, 1600.0, "Chennai"),
            createTouristPlace("Vivekananda House", "Museum dedicated to Swami Vivekananda.", 13.0920, 80.2820, 1700.0, "Chennai"),
            createTouristPlace("Cholamandal Artists' Village", "Art colony with galleries.", 13.0935, 80.2835, 1800.0, "Chennai"),
            createTouristPlace("Kapaleeshwarar Market", "Vibrant market near the temple.", 13.0950, 80.2850, 1900.0, "Chennai")
                );
                placeRepo.saveAll(places);

                List<User> users = Arrays.asList(
            createUser("Sara User", "sara@test.com", "password", "user"),
            createUser("Noah Traveler", "noah@test.com", "password", "user"),
            createUser("Mia Guide", "mia@test.com", "password", "guide"),
            createUser("Liam Admin", "liam@test.com", "password", "admin"),
            createUser("Emma Explorer", "emma@test.com", "password", "user"),
            createUser("Aria Host", "aria@test.com", "password", "guide"),
            createUser("Ethan Guest", "ethan@test.com", "password", "user")
                );
                userRepo.saveAll(users);

                List<Guide> guides = Arrays.asList(
                    createGuide("Ravi Shankar", "History MA", "5 Years", 1500.0, "+91-9876543210", "Mumbai"),
                    createGuide("Antoine Dupont", "Tourism Degree", "8 Years", 2200.0, "+33-612345678", "Paris"),
                    createGuide("Meena Iyer", "Local Heritage Expert", "3 Years", 1200.0, "+91-9988776655", "Chennai"),
                    createGuide("John Smith", "Geography BA", "7 Years", 1800.0, "+1-555-1234", "Los Angeles")
                );
                guideRepo.saveAll(guides);

                System.out.println("Mock data loaded successfully");
            }
        };
    }

    private Homestay createHomestay(String name, String description, Double lat, Double lng, Double amount, Integer rooms, String category, String location) {
        Homestay homestay = new Homestay();
        homestay.setName(name);
        homestay.setDescription(description);
        homestay.setLat(lat);
        homestay.setLng(lng);
        homestay.setAmount(amount);
        homestay.setRooms(rooms);
        homestay.setCategory(category);
        homestay.setLocation(location);
        return homestay;
    }

    private TouristPlace createTouristPlace(String name, String description, Double lat, Double lng, Double amount, String location) {
        TouristPlace place = new TouristPlace();
        place.setName(name);
        place.setDescription(description);
        place.setLat(lat);
        place.setLng(lng);
        place.setAmount(amount);
        place.setLocation(location);
        return place;
    }

    private User createUser(String name, String email, String password, String role) {
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);
        return user;
    }

    private Guide createGuide(String name, String qualification, String experience, Double amount, String contact, String location) {
        Guide guide = new Guide();
        guide.setName(name);
        guide.setQualification(qualification);
        guide.setExperience(experience);
        guide.setAmount(amount);
        guide.setContact(contact);
        guide.setLocation(location);
        return guide;
    }
}
