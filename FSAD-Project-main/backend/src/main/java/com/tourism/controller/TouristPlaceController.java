package com.tourism.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.tourism.model.TouristPlace;
import com.tourism.repository.TouristPlaceRepository;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/tourist-places")
public class TouristPlaceController {

    @Autowired
    private TouristPlaceRepository repository;

    @GetMapping
    public List<TouristPlace> getTouristPlaces(@RequestParam(required = false) String location) {
        List<TouristPlace> all = repository.findAll();
        if (location != null && !location.isEmpty()) {
            return all.stream()
                .filter(t -> (t.getLocation() != null && t.getLocation().toLowerCase().contains(location.toLowerCase())) ||
                             (t.getName() != null && t.getName().toLowerCase().contains(location.toLowerCase())))
                .collect(Collectors.toList());
        }
        return all;
    }
}
