package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.OrderDetailE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDetailRepos")
public interface OrderDetailRepos extends JpaRepository<OrderDetailE, Integer> {
   @Query(nativeQuery = true, value = "select * from order_detail where order_id = :id")
   public List<OrderDetailE> findByIdOrder(@Param("id") int id);
}
