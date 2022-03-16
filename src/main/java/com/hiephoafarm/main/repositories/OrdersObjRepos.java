package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.OrdersObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("ordersObjRepos")
public interface OrdersObjRepos extends JpaRepository<OrdersObj, Integer> {

}
