package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.OrdersE;
import com.hiephoafarm.main.models.ProductE;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ordersRepos")
public interface OrdersRepos extends JpaRepository<OrdersE, Integer> {
    @Query(nativeQuery = true, value = "select * from orders order by id_order DESC")
    public List<OrdersE> findAllOrder ();
    @Query(nativeQuery = true, value = "select * from orders order by id_order DESC")
    public Page<OrdersE> findAllPaging(Pageable pageable);
    @Query(nativeQuery = true, value = "select * from orders where customer_phone = :phonenumber order by id_order DESC")
    public List<OrdersE> searchOrderByPhone (@Param("phonenumber") String phonenumber);
    @Query(nativeQuery = true, value = "select * from orders where customer_name like %:name% order by id_order DESC")
    public List<OrdersE> searchOrderByName (@Param("name") String name);
    @Query(nativeQuery = true, value = "select * from orders where id_order = :id")
    public OrdersE findByIdOrder (@Param("id") int id);
    @Query(nativeQuery = true, value = "select * from orders where status_id = 3")
    public List<OrdersE> findPending ();
    @Query(nativeQuery = true, value = "select * from orders where status_id = 4")
    public List<OrdersE> findProcessing ();
    @Query(nativeQuery = true, value = "select * from orders where status_id=6 and created_time>=:from and created_time<=:to")
    public List<OrdersE> findByTimeRange (@Param("from") String from, @Param("to") String to);
    @Modifying
    @Query(nativeQuery = true, value = "UPDATE orders SET status_id = :statusId WHERE id_order = :id")
    public List<OrdersE> setStatus (@Param("id") int id, @Param("statusId") int statusId);
}
