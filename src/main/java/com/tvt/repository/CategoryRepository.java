package com.tvt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tvt.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
