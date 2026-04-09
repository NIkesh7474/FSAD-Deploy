package com.tourism.backend.controller;

import com.tourism.backend.model.Homestay;
import com.tourism.backend.repository.HomestayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/homestays")
public class HomestayController {

    @Autowired
    private HomestayRepository homestayRepository;

    @GetMapping
    public List<Homestay> getAllHomestays(@RequestParam(required = false) String location) {
        if (location != null && !location.isEmpty()) {
            return homestayRepository.findByLocationContainingIgnoreCaseOrNameContainingIgnoreCase(location, location);
        }
        return homestayRepository.findAll();
    }

    @PostMapping
    public Homestay createHomestay(@RequestBody Homestay homestay) {
        return homestayRepository.save(homestay);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Homestay> updateHomestay(@PathVariable Long id, @RequestBody Homestay homestayDetails) {
        Homestay homestay = homestayRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Homestay not found with id :" + id));

        homestay.setName(homestayDetails.getName());
        homestay.setDescription(homestayDetails.getDescription());
        homestay.setLat(homestayDetails.getLat());
        homestay.setLng(homestayDetails.getLng());
        homestay.setAmount(homestayDetails.getAmount());
        homestay.setRooms(homestayDetails.getRooms());
        homestay.setCategory(homestayDetails.getCategory());
        homestay.setLocation(homestayDetails.getLocation());

        Homestay updatedHomestay = homestayRepository.save(homestay);
        return ResponseEntity.ok(updatedHomestay);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteHomestay(@PathVariable Long id) {
        Homestay homestay = homestayRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Homestay not found with id :" + id));

        homestayRepository.delete(homestay);
        return ResponseEntity.ok().build();
    }
}
