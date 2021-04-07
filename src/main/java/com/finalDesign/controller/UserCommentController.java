package com.finalDesign.controller;


import com.finalDesign.pojo.Essay;
import com.finalDesign.pojo.User;
import com.finalDesign.pojo.UserComment;
import com.finalDesign.service.SchoolService;
import com.finalDesign.service.UserCommentService;
import com.finalDesign.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/userComment")
public class UserCommentController {

    @Autowired
    @Qualifier("UserCommentServiceImpl")
    private UserCommentService userCommentService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;


    @RequestMapping("/addComment")
    public String addComment(UserComment userComment, HttpSession session, Model model, RedirectAttributes redirectAttributes) {

        System.out.println("添加评论时获取用户名字："+session.getAttribute("userLoginInfo"));

        String nameInfo=(String)session.getAttribute("userLoginInfo");
        System.out.println("验证信息----------------"+nameInfo.equals("管理员"));
        if(nameInfo.equals("管理员")){
            userComment.setCommentDisplayName("管理员");
        }else {
            User user=new User();
            user.setUserName((String)session.getAttribute("userLoginInfo"));
            user= userService.findUserByName(user);
            //添加评论名

            userComment.setCommentDisplayName(user.getUserDisplayName());
        }


        //获取当前时间
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        //添加时间
        userComment.setCommentDate(Timestamp.valueOf(nowTime));

        System.out.println("添加评论时获取用户名字：-------------"+userComment.getCommentDisplayName());
        userCommentService.addUserComment(userComment);
        System.out.println("userComment信息-------------------"+userComment);
        System.out.println("当前页面文章名---------------------"+userComment.getCommentEssay());
        //重定向带参数
        redirectAttributes.addAttribute("EssayName",userComment.getCommentEssay());
        return "redirect:/essay/toEssayInner";//重定向redirect:/essay/allEssay
    }

}
