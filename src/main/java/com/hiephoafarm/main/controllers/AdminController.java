package com.hiephoafarm.main.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({"","admin"})
public class AdminController {
    @RequestMapping(value = {"", "index"} ,method = RequestMethod.GET)
    public String index() {
        return "admin/index";
    }
}
