package com.finalDesign.controller;


import com.finalDesign.pojo.Essay;
import com.finalDesign.pojo.School;
import com.finalDesign.pojo.User;
import com.finalDesign.service.EssayService;
import com.finalDesign.service.SchoolService;
import com.finalDesign.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/school")
public class SchoolController {
    @Autowired
    @Qualifier("SchoolServiceImpl")
    private SchoolService schoolService;

    @Autowired
    @Qualifier("EssayServiceImpl")
    private EssayService essayService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("toAddSchool")
    public String toAddSchool() {
        return "addSchool";
    }

    @RequestMapping("/addSchool")
    public String addSchool(@RequestParam("schoolPic2") CommonsMultipartFile file, HttpServletRequest request, School school) throws IOException {
        String path = "D:\\IDEAProjects\\SchoolPicUpload";
        String originalFilename = file.getOriginalFilename();
        String newFileName = UUID.randomUUID() + originalFilename;
        File targetFile = new File(path, newFileName);
        String fileNameInDB = newFileName;
        file.transferTo(targetFile);
        school.setSchoolPic(fileNameInDB);
        System.out.println(school);
        schoolService.addSchool(school);
        return "adminSchool";
    }


    @RequestMapping("/addFile")
    public String addFile(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        String path = "D:\\IDEAProjects\\SchoolPicUpload";
        String originalFilename = file.getOriginalFilename();
        String newFileName = UUID.randomUUID() + originalFilename;
        File targetFile = new File(path, newFileName);
        file.transferTo(targetFile);
        return "redirect:/index.jsp";
    }

    @RequestMapping("/toAddFile")
    public String toAddFile() {
        return "addFile";
    }

    @RequestMapping("/allSchool")
    public String list(Model model) {
        List<School> list = schoolService.queryAllSchool();
        model.addAttribute("list", list);
        return "adminSchool";
    }

    @RequestMapping("toAllSchool")
    public String toAllSchool() {

        return "redirect:/school/allSchool";//?????????
    }

    //??????????????????
    @RequestMapping("toMain")

    public String toMain(Model model) {
        List<School> list = schoolService.queryAllSchool();
        model.addAttribute("list", list);
        return "main";//?????????
    }

    //?????????????????????????????????
    @RequestMapping("toForum")
    public String toForum(int id, Model model) {

        School school = schoolService.querySchoolById(id);

        model.addAttribute("QSchool", school);

        List<Essay> essayList = essayService.queryEssayByCategory(school.getSchoolName());

        model.addAttribute("essayList", essayList);

        System.out.println("????????????" + essayList);

        return "forum2";//
    }

    //?????????????????????
    @RequestMapping("/querySchool")
    public String queryUser(String querySchoolName, Model model) {
        School school = schoolService.querySchoolByName(querySchoolName);
        List<School> list = new ArrayList<School>();
        list.add(school);
        if (school == null) {
            list = schoolService.queryAllSchool();
            model.addAttribute("error", "?????????");
        }

        model.addAttribute("list", list);
        return "allSchool";

    }


    //????????????????????????
    @RequestMapping("/toAddSchoolEssay")
    public String toAddSchoolEssay(int id, Model model, HttpSession session) {
        School school = schoolService.querySchoolById(id);
        User addEssayUser=new User();
        addEssayUser.setUserName((String) session.getAttribute("userLoginInfo"));
        User addEssayUserInfo = userService.findUserByName(addEssayUser);
        model.addAttribute("addEssayUserInfo",addEssayUserInfo);
        model.addAttribute("QSchoolId", school);
        return "addEssay";
    }

    @RequestMapping("/deleteSchool/{schoolId}")
    public String deleteUser(@PathVariable("schoolId") int id) {


        School school=schoolService.querySchoolById(id);
        List<Essay> essayList=  essayService.queryEssayByCategory(school.getSchoolName());
        for(Essay essay:essayList){
            essayService.deleteEssayById(essay.getEssayId());
        }
       schoolService.deleteSchoolById(id);

        return "redirect:/school/allSchool";
    }

}
