package com.finalDesign.controller;


import com.finalDesign.pojo.Admin;
import com.finalDesign.pojo.User;
import com.finalDesign.service.AdminService;
import com.finalDesign.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;

    @RequestMapping(value = "/queryAdminName", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String queryAdminName(String name) {
        String msg = "msg初始值";

        Admin admin = adminService.queryAdminByName(name);
        if (admin == null) {
            System.out.println("user不存在，查询为空");
            msg = "用户名错误";
            System.out.println("1" + msg);
        }
        System.out.println("传递进来的name>==" + name);
        if (name != null) {
            if (admin == null) {
                msg = "用户名错误";
                System.out.println("1" + msg);
            } else {
                msg = "ok";
                System.out.println("返回ok");
            }
        }
        System.out.println(msg);
        return msg;
    }

    @RequestMapping(value = "queryAdminPwd", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String queryAdminPwd(String name, String password) throws Exception {

        String msg = "";
        System.out.println("输入的用户名：" + name);
        System.out.println("输入的密码：" + password);

       Admin admin= adminService.queryAdminByNameAndPassword(name,password);
        if (name != null) {
            if (password != null) {
                if (admin == null) {
                    msg = "密码错误";
                } else {
                    msg = "ok";
                }
            }
        }
        return msg;
    }

    @RequestMapping("toAdminLogin")
    public String toAdminLogin() {
        return "adminLogin";
    }

    @RequestMapping("adminLogin")
    public String adminLogin(String name, String password, HttpSession session, Model model) {

        System.out.println("跳转页面的用户名和密码---------" + name + password);
        Admin adminLogin = adminService.queryAdminByName(name);
        System.out.println(adminLogin);
        if (adminLogin != null) {
            session.setAttribute("userLoginInfo", name);
            session.setAttribute("adminLoginInfo",name);
            System.out.println("用户名字的session" + session.getAttribute("userLoginInfo"));
            model.addAttribute("username", name);
            session.setAttribute("userDisplayName", name);
            System.out.println("账号密码正确" + adminLogin);
            return "redirect:/essay/allEssay";
        } else {
            System.out.println("账号密码错误");
            return "adminLogin";
        }
    }
}
