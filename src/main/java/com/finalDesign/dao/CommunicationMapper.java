package com.finalDesign.dao;

import com.finalDesign.pojo.Communication;

import java.util.List;

public interface CommunicationMapper {

    //添加私信
    int addCommunication(Communication communication);

    //根据名字查找私信
    List<Communication> queryCommunicationByName(String userName);

    List<Communication> queryCommunicationByCommunication(Communication communication);


}
