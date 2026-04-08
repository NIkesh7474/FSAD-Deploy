package com.tourism.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.tourism.model.Booking;
import com.tourism.repository.BookingRepository;
import java.util.HashMap;
import java.util.Map;
import java.time.LocalDate;

@RestController
@RequestMapping("/api/bookings")
public class BookingController {

    @Autowired
    private BookingRepository repository;

    @PostMapping
    public ResponseEntity<Map<String, Object>> createBooking(@RequestBody Booking booking) {
        if(booking.getDate() == null) {
            booking.setDate(LocalDate.now().toString());
        }
        Booking saved = repository.save(booking);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("booking", saved);
        return ResponseEntity.ok(response);
    }
}
