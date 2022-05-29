package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.OrdersE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ordersRepos")
public interface OrdersRepos extends JpaRepository<OrdersE, Integer> {
    @Query(nativeQuery = true, value = "select * from orders where status_id = 3 DESC")
    public List<OrdersE> findPending ();
    @Query(nativeQuery = true, value = "select * from orders where status_id = 4 DESC")
    public List<OrdersE> findProcessing ();
    @Query(nativeQuery = true, value = "UPDATE orders SET status_id = :statusId WHERE id_order = :id")
    public List<OrdersE> setStatus (@Param("id") int id, @Param("statusId") int statusId);
}
