package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.OrderDetailObj;
import com.hiephoafarm.main.models.OrdersE;
import com.hiephoafarm.main.models.OrdersObj;
import com.hiephoafarm.main.repositories.OrderDetailObjRepos;
import com.hiephoafarm.main.repositories.OrdersObjRepos;
import com.hiephoafarm.main.repositories.OrdersRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ordersService")
public class OrdersService {
    @Autowired
    OrdersObjRepos ordersObjRepos;
    @Autowired
    OrdersRepos ordersRepos;
    @Autowired
    OrderDetailObjRepos orderDetailObjRepos;

    public OrdersObj saveOrder(OrdersObj ordersObj){return ordersObjRepos.save(ordersObj);}
    public List<OrdersE> setStatus(int id, int statusId){return ordersRepos.setStatus(id, statusId);}

    public List<OrderDetailObj> saveAllOrderDetail(List<OrderDetailObj> items){return orderDetailObjRepos.saveAll(items);}

    public List<OrdersE> findPending(){return ordersRepos.findPending();}
    public List<OrdersE> findProcessing(){return ordersRepos.findProcessing();}
}
