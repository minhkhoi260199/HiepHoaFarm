package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.ProductE;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Repository("productRepos")
public interface ProductRepos extends JpaRepository<ProductE, Integer> {
   @Query(nativeQuery = true, value = "select * from product where product_name like %:keyword% and status_id <> 8 order by id_product DESC")
   public List<ProductE> search(@Param("keyword") String keyword);
   @Query(nativeQuery = true, value = "select * from product where category_id = :id and status_id <> 8 order by id_product DESC")
   public List<ProductE> searchByCate(@Param("id") int id);
   @Query(nativeQuery = true, value = "select * from product where status_id = 1 order by id_product DESC")
   public List<ProductE> findAllEnabled();
   @Query(nativeQuery = true, value = "select * from product where id_product = :id")
   public ProductE findById(@Param("id") int id);
   @Query(nativeQuery = true, value = "select * from product where status_id <> 8 order by id_product DESC")
   public Page<ProductE> findAllAdminPaging(Pageable pageable);
   @Query(nativeQuery = true, value = "select * from product where status_id <> 8 order by id_product DESC")
   public List<ProductE> findAllAdmin();
   @Modifying
   @Query(nativeQuery = true, value = "update product set status_id = 8 where id_product = :id ")
   public void deleteLogicById(@Param("id") int id);

}
