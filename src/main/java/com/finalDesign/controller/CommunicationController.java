package com.finalDesign.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
        List<Communication> communicationList = communicationService.queryCommunicationByName((String) session.getAttribute("userLoginInfo"));
        System.out.println("communicationList-------------------" + communicationList);
        List<String> communicationNameList = new ArrayList<String>();
        for (Communication communication : communicationList) {
            if (communication.getCommunicationSendName().trim().equals((String) session.getAttribute("userLoginInfo"))) {
                System.out.println("添加接收人到communicationNameList--------------------");
                System.out.println("添加" + communication.getCommunicationReceiverName() + "到List-----------------");
                communicationNameList.add(communication.getCommunicationReceiverName());
                System.out.println("communicationNameList添加了一个--------------------");
            } else {
                System.out.println("添加发送人到communicationNameList--------------------");
                communicationNameList.add(communication.getCommunicationSendName());
            }
        }
        System.out.println("communicationNameList------------------" + communicationNameList);
        communicationNameList = delRepeat(communicationNameList);
        System.out.println("communicationNameList------------------" + communicationNameList);
        model.addAttribute("communicationNameList", communicationNameList);
        model.addAttribute("communicationList", communicationList);
        return "communication";
    }

    @ResponseBody
    @RequestMapping(value = "displayCommunication", produces = "text/html;charset=UTF-8")
    public List<Communication> displayCommunication(HttpSession session, Model model, String userName) {

        System.out.println("点进来的私聊用户------------------"+userName);
//        Communication communication = new Communication();
//        communication.setCommunicationSendName(userName);
//        communication.setCommunicationReceiverName((String) session.getAttribute("userLoginInfo"));
//        List<Communication> communicationList = communicationService.queryCommunicationByCommunication(communication);
//        for(Communication communication1:communicationList){
//            System.out.println(communication1);
//        }

        List<Communication> communicationList = communicationService.queryCommunicationByName(userName);
        List<Communication> communicationInnerList = new ArrayList<Communication>();
        for (Communication communication : communicationList) {
            if (communication.getCommunicationSendName().trim().equals((String) session.getAttribute("userLoginInfo"))) {
                communicationInnerList.add(communication);
            } else if (communication.getCommunicationSendName().trim().equals(userName) && communication.getCommunicationReceiverName().trim().equals((String) session.getAttribute("userLoginInfo"))) {
                communicationInnerList.add(communication);
            }
        }

        System.out.println("私信具体内容--------------" + communicationInnerList);
        model.addAttribute("communicationInnerList",communicationInnerList);
        if (communicationInnerList != null) {
            return communicationInnerList;
        } else {
            return null;
        }

    }
}
