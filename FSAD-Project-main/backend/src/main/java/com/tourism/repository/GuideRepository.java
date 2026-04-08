package com.tourism.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.tourism.model.Guide;

@Repository
public interface GuideRepository extends JpaRepository<Guide, Long> {
}
