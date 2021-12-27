package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.ProductE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("productRepos")
public interface ProductRepos extends JpaRepository<ProductE, Integer> {

}
