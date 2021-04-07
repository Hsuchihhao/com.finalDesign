package com.finalDesign.controller;

import com.finalDesign.pojo.Follow;
import com.finalDesign.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;


@Controller
@RequestMapping("follow")
public class FollowController {

    @Autowired
    @Qualifier("FollowServiceImpl")
    private FollowService followService;

    @ResponseBody
    @RequestMapping(value ="addFollow",produces = "text/html;charset=UTF-8")
    public String addFollow(HttpSession session, String commentEssay, String commentCategory,String followbtn) {
        String msg = "传送信息";
        System.out.println("传送的msg信息---------"+msg);
        String Usersession= (String) session.getAttribute("userLoginInfo");
        System.out.println("用户的session-------"+Usersession);

        String followInfo;
        String guanzhu="关注";
        Follow follow=new Follow();
        follow.setFollowEssay(commentEssay);
        follow.setFollowCategory(commentCategory);

        if (Usersession== null) {
            System.out.println("按钮显示-------------"+followbtn);
            msg = "未登录";
            System.out.println("传送的msg信息-------------"+msg);
        }
        if(Usersession!=null){
            System.out.println("按钮显示-------------"+followbtn);

            System.out.println(Arrays.toString(followbtn.getBytes()));
            System.out.println(Arrays.toString(guanzhu.getBytes()));
            if(followbtn.equals("关注")){
                System.out.println("关注按钮----------------"+followbtn.equals("关注"));
                System.out.println("添加关注到数据库");
                follow.setFollowName((String) session.getAttribute("userLoginInfo"));
                System.out.println("添加的关注信息--------"+follow);
                followService.addFollow(follow);
                msg="已点击关注";
                System.out.println("传送的msg信息-------------"+msg);
            }
            if(followbtn.equals("取消关注")){
                System.out.println("取消关注按钮-----------"+followbtn.equals("取消关注"));
                System.out.println("打印session账号-------"+session.getAttribute("userLoginInfo"));
                //session转成Integer
                System.out.println((String) session.getAttribute("userLoginInfo"));
                System.out.println(commentEssay);
                Follow followDelete=new Follow();
                followDelete.setFollowName((String) session.getAttribute("userLoginInfo"));
                followDelete.setFollowEssay(commentEssay);

                followService.deleteFollowByName(followDelete);
                msg = "已点击取消关注";
                System.out.println("传送的msg信息-------------"+msg);
            }

        }
        return msg;
    }

    @RequestMapping("toBootStrapTest")
    public String toBootStrapTest(){
    return "bootstraptest";
    }

}
