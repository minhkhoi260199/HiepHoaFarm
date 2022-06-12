package com.hiephoafarm.main.controllers;

import com.hiephoafarm.main.services.CategoryService;
import com.hiephoafarm.main.services.OrdersService;
import com.hiephoafarm.main.services.ProductService;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"admin"})
public class AdminController {

    @Autowired
    OrdersService ordersService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    UserService userService;

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

    @RequestMapping(value = {"employees"} ,method = RequestMethod.GET)
    public String employees(ModelMap modelMap) {
        modelMap.put("users", userService.findAllEmployees());
        return "admin/employees";
    }
    @RequestMapping(value = {"searchEmployee"} ,method = RequestMethod.GET)
    public String searchUsers(@RequestParam String searchBy, @RequestParam String keyword, ModelMap modelMap) {
        modelMap.put("users", userService.searchByUsernameEmployee(keyword));
        return "admin/employees";
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
