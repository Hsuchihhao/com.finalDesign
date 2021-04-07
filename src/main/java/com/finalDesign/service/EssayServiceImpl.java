package com.finalDesign.service;

import com.finalDesign.dao.EssayMapper;

import com.finalDesign.pojo.Essay;

import java.util.List;

public class EssayServiceImpl implements EssayService{


    private EssayMapper essayMapper;

    public void setEssayMapper(EssayMapper essayMapper) {
        this.essayMapper = essayMapper;
    }

    @Override
    public int addEssay(Essay essay) {
        return essayMapper.addEssay(essay);
    }

    @Override
    public int deleteEssayById(int id) {
        return essayMapper.deleteEssayById(id);
    }

    @Override
    public int updateEssay(Essay essay) {
        return essayMapper.updateEssay(essay);
    }

    @Override
    public Essay queryEssayById(int id) {
        return essayMapper.queryEssayById(id);
    }

    @Override
    public List<Essay> queryAllEssay() {
        return essayMapper.queryAllEssay();
    }

    @Override
    public Essay queryEssayByName(String essayName) {
        return essayMapper.queryEssayByName(essayName);
    }

    @Override
    public List<Essay> queryEssayByCategory(String essayCategory) {
        return essayMapper.queryEssayByCategory(essayCategory);
    }

    @Override
    public List<Essay> queryEssayByDisplayName(String displayName) {
        return essayMapper.queryEssayByDisplayName(displayName);
    }


}
