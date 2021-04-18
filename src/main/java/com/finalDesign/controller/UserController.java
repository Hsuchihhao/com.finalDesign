package com.finalDesign.controller;


import com.finalDesign.pojo.Books;
import com.finalDesign.pojo.Essay;
import com.finalDesign.pojo.Follow;
import com.finalDesign.pojo.User;
import com.finalDesign.service.EssayService;
import com.finalDesign.service.FollowService;
import com.finalDesign.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("EssayServiceImpl")
    private EssayService essayService;

    @Autowired
    @Qualifier("FollowServiceImpl")
    private FollowService followService;


    @RequestMapping("/allUser")
    public String list(Model model) {
        List<User> list = userService.queryAllUser();
        model.addAttribute("list", list);
        return "allUser";
    }

    @RequestMapping("/toAddUser")
    public String toAddPapper() {
        return "addUser";
    }

    @RequestMapping("/addUser")
    public String addUser(User user) {
        System.out.println("adduser" + user);
        userService.addUser(user);
        return "redirect:/user/allUser";//重定向
    }

    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(int id, Model model) {
        User user = userService.queryUserById(id);
        model.addAttribute("QUser", user);
        return "updateUser";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user) {
        System.out.println("updateuser=>" + user);
        int i = userService.updateUser(user);
        if (i > 0) {
            System.out.println(user);
        }
        return "redirect:/user/allUser";
    }

    @RequestMapping("/deleteUser/{userId}")
    public String deleteUser(@PathVariable("userId") int id) {
        userService.deleteUserById(id);

        return "redirect:/user/allUser";
    }

    @RequestMapping("/queryUser")
    public String queryUser(String queryUserName, Model model) {
        User user = userService.queryUserByName(queryUserName);
        List<User> list = new ArrayList<User>();
        list.add(user);
        if (user == null) {
            list = userService.queryAllUser();
            model.addAttribute("error", "未查到");
        }
        model.addAttribute("list", list);
        return "allUser";
    }

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/toMain")
    public String toMain() {
        return "main";
    }


    @RequestMapping(value = "/queryUserName", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String queryUserName(String name) {
        String msg = "msg初始值";
        User user = new User();
        user.setUserName(name);
        User user1 = userService.findUserByName(user);
        if (user1 == null) {
            System.out.println("user不存在，查询为空");
            msg = "用户名错误";
            System.out.println("1" + msg);
        }
        System.out.println("传递进来的name>==" + name);
        if (name != null) {
            if (user1 == null) {
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

    @RequestMapping(value = "userLogin", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String userLogin(String name, String password) throws Exception {

        String msg = "";
        System.out.println("输入的用户名：" + name);
        System.out.println("输入的密码：" + password);
        User user = new User();
        user.setUserName(name);
        user.setUserPassword(password);
        User userlogin = userService.findUserByNameAndPassword(user);
        if (name != null) {
            if (password != null) {
                if (userlogin == null) {
                    msg = "密码错误";
                } else {
                    msg = "ok";
                }
            }
        }
        return msg;
    }

    @RequestMapping("toUserPage")
    public String UserPage(HttpSession session, Model model) {
        List<Essay> essayList;
        if (session.getAttribute("userLoginInfo").equals("管理员")) {
            essayList = essayService.queryEssayByDisplayName((String) session.getAttribute("userLoginInfo"));
            model.addAttribute("userPageName", (String) session.getAttribute("userLoginInfo"));
            model.addAttribute("userAccount", (String) session.getAttribute("userLoginInfo"));
        } else {
            User user = new User();
            user.setUserName((String) session.getAttribute("userLoginInfo"));
            user = userService.findUserByName(user);
            System.out.println("用户信息---------------" + user);
            essayList = essayService.queryEssayByDisplayName(user.getUserDisplayName());
            model.addAttribute("userPageName", user.getUserDisplayName());

        }

        Integer flag = 1;

        model.addAttribute("checkFlag", flag);
        System.out.println("传递的flag-------" + flag);
        System.out.println("用户发表的文章-------------------------" + essayList);
        model.addAttribute("essayListByDisplayName", essayList);
        List<Follow> followList = followService.queryFollowByName((String) session.getAttribute("userLoginInfo"));
        model.addAttribute("followList", followList);
        return "userPage";
    }

    @RequestMapping("otherUserPage")
    public String otherUserPage(String userName, HttpSession session, Model model) {

        //trim()去掉空格
        userName = userName.trim();
        List<Essay> essayList;
        User user = new User();
        System.out.println(session.getAttribute("userLoginInfo").equals("管理员"));
        //判断是管理员在登录，就不添加user的信息
        if(session.getAttribute("userLoginInfo").equals("管理员")){
            user.setUserDisplayName("管理员");
        }else {
            user.setUserName((String) session.getAttribute("userLoginInfo"));
            user = userService.findUserByName(user);
        }

        System.out.println("已登录用户信息--------------" + user.getUserDisplayName());
        System.out.println("获取到的作者名字--------------" + userName);
        System.out.println("已登录用户信息对比--------------" + user.getUserDisplayName().trim().equals(userName));
        if (!user.getUserDisplayName().trim().equals(userName)) {

            System.out.println("不是自己的个人页面------------------");
            User userRevice = new User();
            userRevice.setUserDisplayName(userName);
            userRevice=userService.findUserByDisplayName(userRevice);
            System.out.println("接收方用户信息-----------" + userRevice);
            essayList = essayService.queryEssayByDisplayName(userName);
            model.addAttribute("essayListByDisplayName", essayList);
            model.addAttribute("userPageName", userName);
            System.out.println("个人页面显示的名字------------------" + userName);
            if(userName.equals("管理员")){
                System.out.println("是管理员页面------------------");
                model.addAttribute("userAccount",userName);
                System.out.println("发送的名字----------------------"+userName);
            }else {
                model.addAttribute("userAccount", userRevice.getUserName());
                System.out.println("发送的名字----------------------"+userRevice.getUserName());
            }

            List<Follow> followList = followService.queryFollowByName(user.getUserName());
            model.addAttribute("followList", followList);
            Integer flag = 0;
            model.addAttribute("checkFlag", flag);
            System.out.println("传递的flag-------" + flag);
            return "userPage";
        } else {
            //跳转到中转页面
            return "userPageIndirect";
        }

    }

    @RequestMapping("toAdminEssay")
    public String toAdminEssay() {
        return "adminEssay";
    }


    @RequestMapping("/toAdminLogin")
    public String toAdminLogin() {
        return "adminLogin";
    }

    @RequestMapping("userPage")
    public String toUserPage(String name, String password, HttpSession session, Model model) {
        User user = new User();
        user.setUserName(name);
        user.setUserPassword(password);
        System.out.println("跳转页面的用户名和密码---------" + name + password);
        User userlogin = userService.findUserByNameAndPassword(user);
        System.out.println(userlogin);
        if (userlogin != null) {
            session.setAttribute("userLoginInfo", name);
            System.out.println("用户名字的session" + session.getAttribute("userLoginInfo"));
            model.addAttribute("username", name);
            session.setAttribute("userDisplayName", name);
            System.out.println("账号密码正确" + userlogin);
            return "userPageIndirect";
        } else {
            System.out.println("账号密码错误");
            return "login";
        }
    }

    @RequestMapping("/goOutUser")
    public String goOutUser(HttpSession session) {
        session.removeAttribute("userLoginInfo");
        return "login";
    }

    //
    @RequestMapping("/goRegister")
    public String goRegister(HttpSession session) {

        return "register";
    }

    //判断用户名是否重复
    @RequestMapping(value = "UserNameRegister", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String UserNameRegister(String name) {
        String msg = "msg初始值";
        User user = new User();
        user.setUserName(name);
        User user1 = userService.findUserByName(user);
        System.out.println("传递进来的name>==" + name);
        if (name != null) {
            if (user1 == null) {
                msg = "ok";
                System.out.println("传送的msg-----" + msg);
            } else {
                msg = "用户名已存在";
                System.out.println("返回用户名已存在");
            }
        }
        System.out.println(msg);
        return msg;
    }

    //判断用户名是否重复
    @RequestMapping(value = "UserDisplayNameRegister", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String UserDisplayNameRegister(String displayName) {
        String msg = "msg初始值";
        User user = new User();
        user.setUserDisplayName(displayName);
        User user1 = userService.findUserByDisplayName(user);
        System.out.println("传递进来的name>==" + displayName);
        System.out.println("获取到的user---------------" + user1);
        if (displayName != null) {
            if (user1 == null) {
                msg = "ok";
                System.out.println("传送的msg-----" + msg);
            } else {
                msg = "名字已存在";
                System.out.println("返回名字已存在");
            }
        }
        System.out.println(msg);
        return msg;
    }


    @RequestMapping("UserRegister")
    public String UserRegister(User user) {
        System.out.println("adduser" + user);
        userService.addUser(user);
        System.out.println("准备添加的用户----------------" + user);
        if (user != null) {
            return "login";
        } else {
            return "register";
        }
    }

//    @RequestMapping("/check")
//    @ResponseBody
//    public String check(HttpServletRequest request) {
//        String checkCode = request.getParameter("g-recaptcha-response");
//        Map<String, Object> map = new HashMap<>();
//        // 私钥
//        map.put("secret", "6Ldnn3cUAAAAADcNDxCOnw_oBV_k0JsvdBMF-KEI");
//        map.put("response", checkCode);
//        String json = MyHttpRequest.sendPost("https://www.recaptcha.net/recaptcha/api/siteverify", map, "UTF-8");
//        return json;
//    }

}
