package com.tourism.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.tourism.model.Homestay;
import com.tourism.repository.HomestayRepository;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/homestays")
public class HomestayController {

    @Autowired
    private HomestayRepository repository;

    @GetMapping
    public List<Homestay> getHomestays(@RequestParam(required = false) String location) {
        List<Homestay> all = repository.findAll();
        if (location != null && !location.isEmpty()) {
            return all.stream()
                .filter(h -> (h.getLocation() != null && h.getLocation().toLowerCase().contains(location.toLowerCase())) ||
                             (h.getName() != null && h.getName().toLowerCase().contains(location.toLowerCase())))
                .collect(Collectors.toList());
        }
        return all;
    }
}
