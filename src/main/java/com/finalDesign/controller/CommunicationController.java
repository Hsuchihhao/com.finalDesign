package com.finalDesign.controller;


import com.finalDesign.pojo.Communication;
import com.finalDesign.service.CommunicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@RequestMapping("/communication")
public class CommunicationController {

    @Autowired
    @Qualifier("CommunicationServiceImpl")
    private CommunicationService communicationService;

    @RequestMapping(value = "sendMassage", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String sendMassage(String communicationText,String communicationReceiverName,HttpSession session){
        System.out.println("进入私信方法--------------------");
        Communication communication=new Communication();
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        communication.setCommunicationSendName((String)session.getAttribute("userLoginInfo"));
        communication.setCommunicationTime(Timestamp.valueOf(nowTime));
        communication.setCommunicationReceiverName(communicationReceiverName);
        communication.setCommunicationText(communicationText);
        System.out.println("私信情况-------------------"+communication);
        communicationService.addCommunication(communication);
        System.out.println("添加私信成功-------------");
        return "ok";
    }

    @RequestMapping("sendMassageTest")
    public String sendMassageTest(){
        return null;
    }
}
