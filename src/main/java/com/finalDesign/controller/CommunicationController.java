package com.finalDesign.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.finalDesign.pojo.Communication;
import com.finalDesign.service.CommunicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
@Controller
@RequestMapping("/communication")
public class CommunicationController {

    @Autowired
    @Qualifier("CommunicationServiceImpl")
    private CommunicationService communicationService;

    //List去重
    public static List<String> delRepeat(List<String> list) {
        List<String> myList = list.stream().distinct().collect(Collectors.toList());
        return myList;
    }


    @RequestMapping(value = "sendMassage", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String sendMassage(String communicationText, String communicationReceiverName, HttpSession session) {
        System.out.println("进入私信方法--------------------");
        Communication communication = new Communication();
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        communication.setCommunicationSendName((String) session.getAttribute("userLoginInfo"));
        communication.setCommunicationTime(Timestamp.valueOf(nowTime));
        communication.setCommunicationReceiverName(communicationReceiverName);
        communication.setCommunicationText(communicationText);
        System.out.println("私信情况-------------------" + communication);
        communicationService.addCommunication(communication);
        System.out.println("添加私信成功-------------");
        return "ok";
    }

    @RequestMapping("toCommunication")
    public String toCommunication(HttpSession session, Model model) {
        //获得当前登录用户所有的私信内容
        List<Communication> communicationList = communicationService.queryCommunicationByName((String) session.getAttribute("userLoginInfo"));
       //打印私信内容
        System.out.println("communicationList-------------------" + communicationList);
        //新建一个
        List<String> communicationNameList = new ArrayList<String>();
        for (Communication communication : communicationList) {
            //如果发送人为当前登录对象
            if (communication.getCommunicationSendName().trim().equals((String) session.getAttribute("userLoginInfo"))) {
                System.out.println("添加接收人到communicationNameList--------------------");
                System.out.println("添加" + communication.getCommunicationReceiverName() + "到List-----------------");
              //添加当前点击的私信对象名字到communicationNameList
                communicationNameList.add(communication.getCommunicationReceiverName());
                System.out.println("communicationNameList添加了一个--------------------");
            } else {
                //如果发送人不是当前登录对象，添加发送名字到communicationNameList
                System.out.println("添加发送人到communicationNameList--------------------");
                communicationNameList.add(communication.getCommunicationSendName());
            }
        }
        System.out.println("communicationNameList------------------" + communicationNameList);
        //List去重
        communicationNameList = delRepeat(communicationNameList);
        System.out.println("communicationNameList------------------" + communicationNameList);
        model.addAttribute("communicationNameList", communicationNameList);
        model.addAttribute("communicationList", communicationList);
        return "communication";
    }

    @ResponseBody
    @RequestMapping(value = "displayCommunication", produces = "text/html;charset=UTF-8")
    public String  displayCommunication(HttpSession session, Model model, String userName) throws JsonProcessingException, ParseException {

        ObjectMapper mapper=new ObjectMapper();
        System.out.println("点进来的私聊用户------------------"+userName);
        System.out.println("当前登录信息-------------------------------"+(String) session.getAttribute("userLoginInfo"));
//        Communication communication = new Communication();
//        communication.setCommunicationSendName(userName);
//        communication.setCommunicationReceiverName((String) session.getAttribute("userLoginInfo"));
//        List<Communication> communicationList = communicationService.queryCommunicationByCommunication(communication);
//        for(Communication communication1:communicationList){
//            System.out.println(communication1);
//        }
        //添加所点击的对象所有的私信到communicationList
        List<Communication> communicationList = communicationService.queryCommunicationByName(userName);
        //新建communicationInnerList
        List<Communication> communicationInnerList = new ArrayList<Communication>();
        for (Communication communication : communicationList) {
            //如果发件人是登录用户，就添加私信到list
            if (communication.getCommunicationSendName().trim().equals((String) session.getAttribute("userLoginInfo"))) {
                communicationInnerList.add(communication);
            } else if (communication.getCommunicationSendName().trim().equals(userName) && communication.getCommunicationReceiverName().trim().equals((String) session.getAttribute("userLoginInfo"))) {
             //如果发件人是当前选定用户，并且收件人是登录用户，也添加私信到list
                communicationInnerList.add(communication);
            }
        }

        for(Communication communication:communicationInnerList){
            System.out.println("私信具体内容--------------" + communication);
        }

        model.addAttribute("communicationInnerList",communicationInnerList);
        for(Communication communication:communicationList){
            System.out.println("转换前的时间-------------------"+communication.getCommunicationTime());
        }
        mapper.configure(SerializationFeature.CLOSE_CLOSEABLE.WRITE_DATES_AS_TIMESTAMPS, false);
        if (communicationInnerList != null) {

//          for(Communication communication:communicationList){
//              System.out.println("转换前的时间-------------------"+communication.getCommunicationTime());
//            Timestamp dateStr=communication.getCommunicationTime();
//              SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//              Date commTime = sdf.parse(String.valueOf(dateStr));
//              communication.setCommunicationTime((Timestamp) commTime);
//              System.out.println("转换后的时间-------------------"+communication.getCommunicationTime());
//
//          }
        String str= mapper.writeValueAsString(communicationInnerList);
            return str;
        } else {
            return null;
        }

    }

    @RequestMapping("toCommTest")
    public String toCommTest(){
        return "commTest";
    }

    @RequestMapping("newAdmin")
    public String toNewAdmin(){
        return "adminMain";
    }
}
