package com.tourism.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.tourism.model.User;
import com.tourism.repository.UserRepository;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    
    @Autowired
    private UserRepository repository;

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> request) {
        String identifier = request.get("identifier");
        String password = request.get("password");
        Optional<User> user = repository.findByEmailAndPassword(identifier, password);
        if (!user.isPresent()) {
            user = repository.findByNameAndPassword(identifier, password);
        }

        Map<String, Object> response = new HashMap<>();
        if (user.isPresent()) {
            response.put("success", true);
            response.put("user", user.get());
        } else {
            response.put("success", false);
            response.put("message", "Invalid username/email or password");
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/register")
    public ResponseEntity<Map<String, Object>> register(@RequestBody User user) {
        if (user.getRole() == null) {
            user.setRole("user");
        }
        User saved = repository.save(user);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("user", saved);
        return ResponseEntity.ok(response);
    }
}
