package com.hiephoafarm.main.controllers;

import com.hiephoafarm.main.models.OrdersE;
import com.hiephoafarm.main.services.OrdersService;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping({"orders"})
public class OrdersController {

    @Autowired
    OrdersService ordersService;
    @Autowired
    UserService userService;

    @RequestMapping(value = {"index"} ,method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.put("pendings", ordersService.findPending());
        modelMap.put("processing", ordersService.findProcessing());
        return "admin/index";
    }
    @RequestMapping(value = {"users"} ,method = RequestMethod.GET)
    public String users(ModelMap modelMap) {
        modelMap.put("users", userService.findAllUsers());
        return "admin/users";
    }

    @RequestMapping(value = {"searchUsers"} ,method = RequestMethod.GET)
    public String searchUsers(@RequestParam String searchBy, @RequestParam String keyword, ModelMap modelMap) {
        modelMap.put("users", userService.searchByUsername(keyword));
        return "admin/users";
    }

    @RequestMapping(value = {"orders"} ,method = RequestMethod.GET)
    public String orders(ModelMap modelMap,
                         @RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                         @RequestParam(name = "size", required = false, defaultValue = "10") Integer size) {
        modelMap.put("countOrders", ordersService.countAll());
//        Sort sortable = Sort.by("id_product").descending();
        Pageable pageable = PageRequest.of(page-1, size);
        modelMap.put("orders", ordersService.findAllPaging(pageable).toList());
        modelMap.put("setCurrentPage", page);
//        modelMap.put("products", productService.findAll());
//        modelMap.put("orders", ordersService.findAllOrder());
        return "admin/orders";
    }

    @RequestMapping(value = {"searchOrsers"} ,method = RequestMethod.GET)
    public String searchOrders(@RequestParam String searchBy, @RequestParam String keyword, ModelMap modelMap) {
        switch (searchBy){
            case "phone" : modelMap.put("orders", ordersService.searchByPhone(keyword)); break;
            case "name" : modelMap.put("orders", ordersService.searchByName(keyword)); break;
            default: modelMap.put("orders", ordersService.searchByName(keyword));
        }
        return "admin/orders";
    }

    @RequestMapping(value = {"report"} ,method = RequestMethod.GET)
    public String report(@RequestParam(name = "from", required = false) String from,
                         @RequestParam(name = "to", required = false) String to,
                         ModelMap modelMap) {
        if(from!=null && to!=null){
            System.out.println("before:"+from);
//            Format f = new SimpleDateFormat("dd/MM/yyyy");
//            System.out.println("after:"+f.format(from));
//            modelMap.put("from", f.format(from));
//            modelMap.put("to", f.format(to));
            List<OrdersE> orders = ordersService.findByTimeRange(from,to);
            modelMap.put("orders", orders);
            modelMap.put("orderCount", orders.size());
            long totalAmount = 0;
            for (OrdersE order : orders){
                totalAmount+=order.getOrderAmount();
            }
            System.out.println("totalAmount:"+totalAmount);
            modelMap.put("totalAmount", totalAmount);
        }
        return "admin/report";
    }

}
