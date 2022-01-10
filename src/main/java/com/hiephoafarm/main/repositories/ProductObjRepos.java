package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.ProductObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("productObjRepos")
public interface ProductObjRepos extends JpaRepository<ProductObj, Integer> {

}
