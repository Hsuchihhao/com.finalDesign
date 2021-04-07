package com.finalDesign.controller;


import com.finalDesign.pojo.*;
import com.finalDesign.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/essay")
public class EssayController {

    @Autowired
    @Qualifier("EssayServiceImpl")
    private EssayService essayService;

    @Autowired
    @Qualifier("UserCommentServiceImpl")
    private UserCommentService userCommentService;

    @Autowired
    @Qualifier("FollowServiceImpl")
    private FollowService followService;

    @Autowired
    @Qualifier("SchoolServiceImpl")
    private SchoolService schoolService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("/allEssay")
    public String list(Model model) {
        List<Essay> list = essayService.queryAllEssay();
        model.addAttribute("list", list);

        System.out.println("管理员界面全部文章------"+list);
        return "adminEssay";
    }

    @RequestMapping("/toAdminAddEssay")
    public String toAdminAddEssay(Model model,HttpSession session) {
        List<School> schoolList=schoolService.queryAllSchool();
        model.addAttribute("QSchool",schoolList);

       String adminInfo=((String) session.getAttribute("userLoginInfo"));
        model.addAttribute("addEssayUserInfo",adminInfo);
        System.out.println("管理员信息--------------------"+adminInfo);
        return "adminAddEssay";
    }

    @RequestMapping("/addEssay")
    public String addEssay(Essay essay, HttpSession session) {
        System.out.println("addessay" + essay);
        System.out.println("添加文章时获取用户名字："+session.getAttribute("userLoginInfo"));
        if(session.getAttribute("userLoginInfo").equals("管理员")){
            essay.setEssayUserDisplayName((String) session.getAttribute("userLoginInfo"));
        }else {
            User user=new User();
            user.setUserName((String)session.getAttribute("userLoginInfo"));
            user=userService.findUserByName(user);
            essay.setEssayUserDisplayName(user.getUserDisplayName());
        }


        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        essay.setEssayCreateTime(Timestamp.valueOf(nowTime));
        System.out.println("添加文章时获取用户名字：-------------"+essay.getEssayUserDisplayName());
        essayService.addEssay(essay);
        return "redirect:/school/toMain";//重定向
    }

    @RequestMapping("/toUpdateEssay")
    public String toUpdateEssay(int id, Model model) {
        System.out.println("获取修改文章的id------------"+id);
        Essay essay = essayService.queryEssayById(id);
        model.addAttribute("QEssay", essay);
        List<School> schoolList=schoolService.queryAllSchool();
        model.addAttribute("QSchool",schoolList);
        return "updateEssay";
    }

    @RequestMapping("/updateEssay")
    public String updateEssay(Essay essay) {
        System.out.println("updateuser=>" + essay);
        int i = essayService.updateEssay(essay);
        if (i > 0) {
            System.out.println(essay);
        }
        return "redirect:/essay/allEssay";
    }

    @RequestMapping("/deleteEssay/{essayId}")
    public String deleteEssay(@PathVariable("essayId") int id) {
        essayService.deleteEssayById(id);

        return "redirect:/essay/allEssay";
    }

    @RequestMapping("/queryEssay")
    public String queryEssay(String queryEssayName, Model model) {
        Essay essay = essayService.queryEssayByName(queryEssayName);
        List<Essay> list = new ArrayList<Essay>();
        list.add(essay);
        if (essay == null) {
            list = essayService.queryAllEssay();
            model.addAttribute("error", "未查到");
        }
        model.addAttribute("list", list);
        return "adminEssay";
    }

    @RequestMapping("/toEssayInner")
    public String toEssayInner(String EssayName,Model model,HttpSession session){
        Essay essayInner=essayService.queryEssayByName(EssayName);
        System.out.println("文章题目------------"+EssayName);
        model.addAttribute("essayInner",essayInner);
        List<UserComment> userCommentInnerList=userCommentService.queryUserCommentByEssay(EssayName);
        model.addAttribute("userCommentInnerList",userCommentInnerList);
        System.out.println("文章评论------------------------"+userCommentInnerList);

        Follow followToInner=new Follow();
        followToInner.setFollowEssay(EssayName);
        followToInner.setFollowName((String) session.getAttribute("userLoginInfo"));
        if(followService.queryFollowByNameAndEssay(followToInner)!=null){
            model.addAttribute("followInnerInfo","取消关注");
        }else {
            model.addAttribute("followInnerInfo","关注");
        }
        return "essayInner";
    }

    @RequestMapping("/queryEssayToForum")
    public String queryEssayToForum(String queryEssayName, Model model) {
        Essay essay = essayService.queryEssayByName(queryEssayName);
        List<Essay> list = new ArrayList<Essay>();
        list.add(essay);
        if (essay == null) {
            list = essayService.queryAllEssay();
            model.addAttribute("error", "未查到");
        }
        model.addAttribute("list", list);
        return "adminEssay";
    }

    @ResponseBody
    @RequestMapping(value = "queryEssayRepeat", produces = "text/html;charset=UTF-8")
    public String queryEssayRepeat(String EssayName){
        Essay essay = essayService.queryEssayByName(EssayName);
        if(essay==null){
            return "ok";
        }else {
            return "标题已存在";
        }
    }


}
