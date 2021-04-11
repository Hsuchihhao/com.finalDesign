package com.finalDesign.service;

import com.finalDesign.pojo.Communication;

import java.util.List;

public interface CommunicationService {
    int addCommunication(Communication communication);

    List<Communication> queryCommunicationByName(String userName);

    List<Communication> queryCommunicationByCommunication(Communication communication);

}
