package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.ReviewE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Repository("reviewRepos")
public interface ReviewRepos extends JpaRepository<ReviewE, Integer> {

   @Query(nativeQuery = true, value = "select * from review where product_id = :id order by created_time DESC")
   public List<ReviewE> findReviewByProductId(@Param("id") int id);
}
