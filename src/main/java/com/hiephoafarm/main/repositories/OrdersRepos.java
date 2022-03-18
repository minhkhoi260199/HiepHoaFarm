package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.OrdersE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ordersRepos")
public interface OrdersRepos extends JpaRepository<OrdersE, Integer> {
    @Query(nativeQuery = true, value = "select * from orders where status_id = 3")
    public List<OrdersE> findPending ();
    @Query(nativeQuery = true, value = "select * from orders where status_id = 4")
    public List<OrdersE> findProcessing ();
}
