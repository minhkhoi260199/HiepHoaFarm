package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.ProductObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("productObjRepos")
public interface ProductObjRepos extends JpaRepository<ProductObj, Integer> {
   @Query(nativeQuery = true, value = "select * from product where id_product = :id")
   public ProductObj findById(@Param("id") int id);
}
