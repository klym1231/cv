package com.ken.undecemberTest.repositories;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ken.undecemberTest.model.Items;



public interface ItemRepository extends JpaRepository<Items, Long> {

    List<Items> findAll();
    
    
}