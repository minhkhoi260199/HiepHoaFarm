package com.hiephoafarm.main.repositories;

import com.hiephoafarm.main.models.OrderDetailObj;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("orderDetailObjRepos")
public interface OrderDetailObjRepos extends JpaRepository<OrderDetailObj, Integer> {
}
