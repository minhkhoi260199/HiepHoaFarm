package com.hiephoafarm.main.controllers;

import com.hiephoafarm.main.services.CategoryService;
import com.hiephoafarm.main.services.OrdersService;
import com.hiephoafarm.main.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping({"","admin"})
public class AdminController {

    @Autowired
    OrdersService ordersService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;

    @RequestMapping(value = {"","index"} ,method = RequestMethod.GET)
    public String index(ModelMap modelMap) {
        modelMap.put("pendings", ordersService.findPending());
        modelMap.put("processing", ordersService.findProcessing());
        return "admin/index";
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

    @RequestMapping(value = {"searchProducts"} ,method = RequestMethod.GET)
    public String searchProducts(@RequestParam String searchBy, @RequestParam String keyword, ModelMap modelMap) {
        modelMap.put("products", productService.search(keyword));
        return "admin/products";
    }

    @RequestMapping(value = {"retail"} ,method = RequestMethod.GET)
    public String retail() {
        return "admin/comingSoon";
    }

    @RequestMapping(value = {"wholeSale"} ,method = RequestMethod.GET)
    public String wholeSale() {
        return "admin/comingSoon";
    }

    @RequestMapping(value = {"product"} ,method = RequestMethod.GET)
    public String product(ModelMap modelMap) {
        modelMap.put("countProduct", productService.countAll());
//        Pageable pageable = PageRequest.of(1, 5, Sort.by("idProduct").descending());
//        modelMap.put("products", productService.loadData(pageable));
        modelMap.put("products", productService.findAll());
        return "admin/products";
    }

    @RequestMapping(value = {"category"} ,method = RequestMethod.GET)
    public String category(ModelMap modelMap) {
        modelMap.put("categories", categoryService.findAll4view());
        return "admin/categories";
    }
    @RequestMapping(value = {"about"} ,method = RequestMethod.GET)
    public String about() {
        return "admin/comingSoon";
    }

    @RequestMapping(value = {"contact"} ,method = RequestMethod.GET)
    public String contact() {
        return "admin/comingSoon";
    }

    @RequestMapping(value = {"ads"} ,method = RequestMethod.GET)
    public String ads() {
        return "admin/comingSoon";
    }

}
