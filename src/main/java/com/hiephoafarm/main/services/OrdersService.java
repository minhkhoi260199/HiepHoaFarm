package com.hiephoafarm.main.services;

import com.hiephoafarm.main.models.*;
import com.hiephoafarm.main.repositories.OrderDetailObjRepos;
import com.hiephoafarm.main.repositories.OrderDetailRepos;
import com.hiephoafarm.main.repositories.OrdersObjRepos;
import com.hiephoafarm.main.repositories.OrdersRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service("ordersService")
public class OrdersService {
    @Autowired
    OrdersObjRepos ordersObjRepos;
    @Autowired
    OrdersRepos ordersRepos;
    @Autowired
    OrderDetailObjRepos orderDetailObjRepos;
    @Autowired
    OrderDetailRepos orderDetailRepos;

    public long countAll(){return ordersRepos.count();}
    public List<OrdersE> findAllOrder(){return ordersRepos.findAllOrder();}
    public Page<OrdersE> findAllPaging(Pageable pageable) { return ordersRepos.findAllPaging(pageable);}
    public OrdersE findByIdOrder(int id){return ordersRepos.findByIdOrder(id);}

    public List<OrdersE> searchByPhone(String phonenumber){return ordersRepos.searchOrderByPhone(phonenumber);}
    public List<OrdersE> searchByName(String name){return ordersRepos.searchOrderByName(name);}

    public OrdersObj saveOrder(OrdersObj ordersObj){return ordersObjRepos.save(ordersObj);}
    public List<OrdersE> setStatus(int id, int statusId){return ordersRepos.setStatus(id, statusId);}

    public List<OrderDetailObj> saveAllOrderDetail(List<OrderDetailObj> items){return orderDetailObjRepos.saveAll(items);}

    public List<OrdersE> findPending(){return ordersRepos.findPending();}
    public List<OrdersE> findProcessing(){return ordersRepos.findProcessing();}
    public List<OrdersE> findByTimeRange(String from, String to) {return ordersRepos.findByTimeRange(from, to);}

    public List<OrderDetailE> findDetailByIdOrder(int id) { return orderDetailRepos.findByIdOrder(id);}
}
