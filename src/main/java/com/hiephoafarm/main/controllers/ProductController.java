package com.hiephoafarm.main.controllers;

import com.hiephoafarm.main.services.CategoryService;
import com.hiephoafarm.main.services.OrdersService;
import com.hiephoafarm.main.services.ProductService;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"product"})
public class ProductController {

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

    @RequestMapping(value = {"infos"} ,method = RequestMethod.GET)
    public String product(ModelMap modelMap,
                          @RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                          @RequestParam(name = "size", required = false, defaultValue = "5") Integer size) {
        modelMap.put("countProduct", productService.countAll());
//        Sort sortable = Sort.by("id_product").descending();
        Pageable pageable = PageRequest.of(page-1, size);
        modelMap.put("products", productService.findAllAdminPaging(pageable).toList());
        modelMap.put("setCurrentPage", page);
//        modelMap.put("products", productService.findAll());
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
