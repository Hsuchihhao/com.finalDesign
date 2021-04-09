package com.finalDesign.service;

import com.finalDesign.dao.CommunicationMapper;
import com.finalDesign.pojo.Communication;

public class CommunicationServiceImpl implements CommunicationService{
    private CommunicationMapper communicationMapper;
    public void setCommunicationMapper(CommunicationMapper communicationMapper) {
        this.communicationMapper = communicationMapper;
    }

    public int addCommunication(Communication communication) {
        return communicationMapper.addCommunication(communication);
    }
}
