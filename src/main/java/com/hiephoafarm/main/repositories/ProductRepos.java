package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.ProductE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productRepos")
public interface ProductRepos extends JpaRepository<ProductE, Integer> {
   @Query(nativeQuery = true, value = "select * from product where product_name like %:keyword%")
   public List<ProductE> search(@Param("keyword") String keyword);
   @Query(nativeQuery = true, value = "select * from product where category_id = :id")
   public List<ProductE> searchByCate(@Param("id") int id);
}
