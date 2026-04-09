package com.tourism.backend.repository;

import com.tourism.backend.model.Homestay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HomestayRepository extends JpaRepository<Homestay, Long> {
    List<Homestay> findByLocationContainingIgnoreCaseOrNameContainingIgnoreCase(String location, String name);
}
