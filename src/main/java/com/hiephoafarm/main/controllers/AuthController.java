package com.hiephoafarm.main.controllers;

import com.hiephoafarm.main.models.UserE;
import com.hiephoafarm.main.models.UserObj;
import com.hiephoafarm.main.services.RoleService;
import com.hiephoafarm.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"","auth"})
public class AuthController {

    @Autowired
    RoleService roleService;
    @Autowired
    UserService userService;

    @RequestMapping(value = {"","login"}, method = RequestMethod.GET)
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
        if (error != null) {
            modelMap.put("msg", "Login - Failed !!! ");
        }
        if (logout != null) {
            modelMap.put("msg", "Logout Successful");
        }
//        modelMap.put("user", new UserE());
        return "auth/login";
    }

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register(ModelMap modelMap, @RequestParam(value = "error", required = false) String error) {
        if(error!=null){
            modelMap.put("msg", "Username đã tồn tại !");
        }
        modelMap.put("user", new UserObj());
        return "auth/register";
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(@ModelAttribute("user") UserObj account) {
        UserE user = userService.findByUsername(account.getUsername());
        if(user != null){
            if(account.getUsername().equals(user.getUsername())){
                return "redirect:/auth/register?error";
            }
        }
        String password = account.getPassword().trim();
        String hash = new BCryptPasswordEncoder().encode(password);
        account.setPassword(hash);
        account.setRoleId(2);
        account.setStatusId(1);
        userService.save(account);
        return "redirect:/admin/employees";
    }

    @RequestMapping(value = "accessDenied", method = RequestMethod.GET)
    public String accessDenied() {
        return "auth/accessDenied";
    }

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public String profile(Authentication authentication, ModelMap modelMap,
                          @RequestParam(value = "error", required = false) String error) {
        if(error!=null){
            modelMap.put("msg", "Nhập thiếu thông tin hoặc Username đã tồn tại !");
        }
        UserObj user = userService.findUserObjByUsername(authentication.getName());
        modelMap.put("user", user);
        return "auth/profile";
    }

    @RequestMapping(value = "profile", method = RequestMethod.POST)
    public String saveProfile(Authentication authentication, @ModelAttribute("user") UserObj account) {
        UserE user = userService.findByUsername(authentication.getName());
        if(!account.getPassword().equals(user.getPassword())){
            String password = account.getPassword().trim();
            String hash = new BCryptPasswordEncoder().encode(password);
            account.setPassword(hash);
        }
        try {
            userService.save(account);
        } catch (Exception e) {
            return "redirect:/auth/profile?errol";
        }
        return "redirect:/orders/index";
    }

}
