package com.tourism.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.tourism.model.Homestay;

@Repository
public interface HomestayRepository extends JpaRepository<Homestay, Long> {
}
