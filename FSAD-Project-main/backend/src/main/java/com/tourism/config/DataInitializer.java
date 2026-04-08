package com.tourism.config;

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
                // Seed Homestays
                Homestay h1 = new Homestay(); h1.setName("Sunset Villa"); h1.setDescription("Beautiful view of the valley with high-speed internet."); h1.setLat(34.0522); h1.setLng(-118.2437); h1.setAmount(4500.0); h1.setRooms(2); h1.setCategory("double bedroom"); h1.setLocation("Los Angeles");
                Homestay h2 = new Homestay(); h2.setName("Cozy Cabin"); h2.setDescription("In the woods, perfect for a retreat."); h2.setLat(40.7128); h2.setLng(-74.0060); h2.setAmount(2500.0); h2.setRooms(1); h2.setCategory("single bedroom"); h2.setLocation("New York");
                Homestay h3 = new Homestay(); h3.setName("Eiffel Dream"); h3.setDescription("See the tower from your window."); h3.setLat(48.8584); h3.setLng(2.2945); h3.setAmount(4800.0); h3.setRooms(3); h3.setCategory("triple bedroom"); h3.setLocation("Paris");
                Homestay h4 = new Homestay(); h4.setName("Montmartre Artist Studio"); h4.setDescription("A creative vibe in the heart of Paris."); h4.setLat(48.8867); h4.setLng(2.3431); h4.setAmount(3200.0); h4.setRooms(1); h4.setCategory("single bedroom"); h4.setLocation("Paris");
                Homestay h5 = new Homestay(); h5.setName("Marine Drive Sea View"); h5.setDescription("Wake up to the sound of waves in Mumbai."); h5.setLat(18.944); h5.setLng(72.823); h5.setAmount(3500.0); h5.setRooms(2); h5.setCategory("double bedroom"); h5.setLocation("Mumbai");
                Homestay h6 = new Homestay(); h6.setName("Bandra Heritage Home"); h6.setDescription("Experience classic Mumbai lifestyle."); h6.setLat(19.0596); h6.setLng(72.8295); h6.setAmount(2800.0); h6.setRooms(1); h6.setCategory("single bedroom"); h6.setLocation("Mumbai");
                Homestay h7 = new Homestay(); h7.setName("Marina Beach Retreat"); h7.setDescription("Walking distance from the spectacular Marina Beach."); h7.setLat(13.05); h7.setLng(80.2824); h7.setAmount(2100.0); h7.setRooms(2); h7.setCategory("double bedroom"); h7.setLocation("Chennai");
                Homestay h8 = new Homestay(); h8.setName("Mylapore Traditional Stay"); h8.setDescription("Immerse in the heritage of Chennai."); h8.setLat(13.0368); h8.setLng(80.2676); h8.setAmount(1900.0); h8.setRooms(3); h8.setCategory("triple bedroom"); h8.setLocation("Chennai");
                homestayRepo.save(h1); homestayRepo.save(h2); homestayRepo.save(h3); homestayRepo.save(h4);
                homestayRepo.save(h5); homestayRepo.save(h6); homestayRepo.save(h7); homestayRepo.save(h8);

                // Seed Tourist Places
                TouristPlace t1 = new TouristPlace(); t1.setName("Hollywood Sign"); t1.setDescription("Iconic landmark offering hiking trails."); t1.setLat(34.1341); t1.setLng(-118.3215); t1.setAmount(1500.0); t1.setLocation("Los Angeles");
                TouristPlace t2 = new TouristPlace(); t2.setName("Statue of Liberty"); t2.setDescription("Historical monument on Ellis Island."); t2.setLat(40.6892); t2.setLng(-74.0445); t2.setAmount(1800.0); t2.setLocation("New York");
                TouristPlace t3 = new TouristPlace(); t3.setName("Eiffel Tower"); t3.setDescription("Most-visited paid monument in the world."); t3.setLat(48.8584); t3.setLng(2.2945); t3.setAmount(2000.0); t3.setLocation("Paris");
                TouristPlace t4 = new TouristPlace(); t4.setName("Louvre Museum"); t4.setDescription("World's largest art museum."); t4.setLat(48.8606); t4.setLng(2.3376); t4.setAmount(1200.0); t4.setLocation("Paris");
                TouristPlace t5 = new TouristPlace(); t5.setName("Gateway of India"); t5.setDescription("Iconic arch monument built in the early 20th century."); t5.setLat(18.922); t5.setLng(72.834); t5.setAmount(1000.0); t5.setLocation("Mumbai");
                TouristPlace t6 = new TouristPlace(); t6.setName("Siddhivinayak Temple"); t6.setDescription("Historic and popular Hindu temple."); t6.setLat(19.0166); t6.setLng(72.8306); t6.setAmount(1100.0); t6.setLocation("Mumbai");
                TouristPlace t7 = new TouristPlace(); t7.setName("Marina Beach"); t7.setDescription("Longest natural urban beach in India."); t7.setLat(13.05); t7.setLng(80.2824); t7.setAmount(1500.0); t7.setLocation("Chennai");
                TouristPlace t8 = new TouristPlace(); t8.setName("Kapaleeshwarar Temple"); t8.setDescription("Stunning Dravidian architecture temple."); t8.setLat(13.0335); t8.setLng(80.2706); t8.setAmount(1200.0); t8.setLocation("Chennai");
                placeRepo.save(t1); placeRepo.save(t2); placeRepo.save(t3); placeRepo.save(t4);
                placeRepo.save(t5); placeRepo.save(t6); placeRepo.save(t7); placeRepo.save(t8);

                // Seed Guides
                Guide g1 = new Guide(); g1.setName("Ravi Shankar"); g1.setQualification("History MA"); g1.setExperience("5 Years"); g1.setAmount(1500.0); g1.setContact("+91-9876543210"); g1.setLocation("Mumbai");
                Guide g2 = new Guide(); g2.setName("Antoine Dupont"); g2.setQualification("Tourism Degree"); g2.setExperience("8 Years"); g2.setAmount(2200.0); g2.setContact("+33-612345678"); g2.setLocation("Paris");
                Guide g3 = new Guide(); g3.setName("Meena Iyer"); g3.setQualification("Local Heritage Expert"); g3.setExperience("3 Years"); g3.setAmount(1200.0); g3.setContact("+91-9988776655"); g3.setLocation("Chennai");
                Guide g4 = new Guide(); g4.setName("John Smith"); g4.setQualification("Geography BA"); g4.setExperience("7 Years"); g4.setAmount(1800.0); g4.setContact("+1-555-1234"); g4.setLocation("Los Angeles");
                guideRepo.save(g1); guideRepo.save(g2); guideRepo.save(g3); guideRepo.save(g4);

                // Seed Users
                User u1 = new User(); u1.setName("Alice Admin"); u1.setEmail("admin@test.com"); u1.setPassword("password"); u1.setRole("admin");
                User u2 = new User(); u2.setName("Bob User"); u2.setEmail("user@test.com"); u2.setPassword("password"); u2.setRole("user");
                User u3 = new User(); u3.setName("Ravi Shankar"); u3.setEmail("guide@test.com"); u3.setPassword("password"); u3.setRole("guide");
                userRepo.save(u1); userRepo.save(u2); userRepo.save(u3);
                
                System.out.println("Mock data loaded successfully");
            }
        };
    }
}
