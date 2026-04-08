package com.tourism.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.tourism.model.TouristPlace;

@Repository
public interface TouristPlaceRepository extends JpaRepository<TouristPlace, Long> {
}
