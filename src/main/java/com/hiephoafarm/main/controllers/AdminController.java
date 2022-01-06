package com.hiephoafarm.main.controllers;

import com.hiephoafarm.main.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({"","admin"})
public class AdminController {

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = {"index"} ,method = RequestMethod.GET)
    public String index() {
        return "admin/index";
    }

    @RequestMapping(value = {"retail"} ,method = RequestMethod.GET)
    public String retail() {
        return "admin/comingSoon";
    }

    @RequestMapping(value = {"wholeSale"} ,method = RequestMethod.GET)
    public String wholeSale() {
        return "admin/comingSoon";
    }

    @RequestMapping(value = {"","product"} ,method = RequestMethod.GET)
    public String product() {
        return "admin/products";
    }

    @RequestMapping(value = {"category"} ,method = RequestMethod.GET)
    public String category(ModelMap modelMap) {
        modelMap.put("categories", categoryService.findAll());
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
