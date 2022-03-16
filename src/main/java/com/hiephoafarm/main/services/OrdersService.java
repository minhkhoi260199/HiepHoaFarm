package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.OrderDetailObj;
import com.hiephoafarm.main.models.OrdersObj;
import com.hiephoafarm.main.repositories.OrderDetailObjRepos;
import com.hiephoafarm.main.repositories.OrdersObjRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ordersService")
public class OrdersService {
    @Autowired
    OrdersObjRepos ordersObjRepos;
    @Autowired
    OrderDetailObjRepos orderDetailObjRepos;

    public OrdersObj saveOrder(OrdersObj ordersObj){return ordersObjRepos.save(ordersObj);}
    public List<OrderDetailObj> saveAllOrderDetail(List<OrderDetailObj> items){return orderDetailObjRepos.saveAll(items);}

}
