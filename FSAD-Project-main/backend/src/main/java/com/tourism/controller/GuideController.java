package com.tourism.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.tourism.model.Guide;
import com.tourism.repository.GuideRepository;
import java.util.List;

@RestController
@RequestMapping("/api/guides")
public class GuideController {

    @Autowired
    private GuideRepository repository;

    @GetMapping
    public List<Guide> getGuides() {
        return repository.findAll();
    }
}
