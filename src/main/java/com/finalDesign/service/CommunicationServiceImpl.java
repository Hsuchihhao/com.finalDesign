package com.finalDesign.service;

import com.finalDesign.dao.CommunicationMapper;
import com.finalDesign.pojo.Communication;

import java.util.List;

public class CommunicationServiceImpl implements CommunicationService{
    private CommunicationMapper communicationMapper;
    public void setCommunicationMapper(CommunicationMapper communicationMapper) {
        this.communicationMapper = communicationMapper;
    }

    public int addCommunication(Communication communication) {
        return communicationMapper.addCommunication(communication);
    }

    @Override
    public List<Communication> queryCommunicationByName(String userName) {
        return communicationMapper.queryCommunicationByName(userName);
    }

    @Override
    public List<Communication> queryCommunicationByCommunication(Communication communication) {
        return communicationMapper.queryCommunicationByCommunication(communication);
    }
}
