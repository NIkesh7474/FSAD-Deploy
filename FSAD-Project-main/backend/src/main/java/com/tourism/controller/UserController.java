package com.tourism.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.tourism.model.User;
import com.tourism.repository.UserRepository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserRepository repository;

    @GetMapping
    public List<User> getAllUsers() {
        return repository.findAll();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, Object>> deleteUser(@PathVariable Long id) {
        Map<String, Object> response = new HashMap<>();
        if (!repository.existsById(id)) {
            response.put("success", false);
            response.put("message", "User not found");
            return ResponseEntity.badRequest().body(response);
        }
        repository.deleteById(id);
        response.put("success", true);
        return ResponseEntity.ok(response);
    }

    @PutMapping("/{id}/role")
    public ResponseEntity<Map<String, Object>> updateRole(@PathVariable Long id, @RequestBody Map<String, String> body) {
        Optional<User> optionalUser = repository.findById(id);
        Map<String, Object> response = new HashMap<>();
        if (optionalUser.isEmpty()) {
            response.put("success", false);
            response.put("message", "User not found");
            return ResponseEntity.badRequest().body(response);
        }
        User user = optionalUser.get();
        user.setRole(body.get("role"));
        User updated = repository.save(user);
        response.put("success", true);
        response.put("user", updated);
        return ResponseEntity.ok(response);
    }
}
