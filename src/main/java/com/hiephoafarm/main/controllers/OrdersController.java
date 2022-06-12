package com.hiephoafarm.main.controllers;

import com.hiephoafarm.main.services.OrdersService;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String orders(ModelMap modelMap) {
        modelMap.put("orders", ordersService.findAllOrder());
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

}
