package com.finalDesign.service;

import com.finalDesign.pojo.Essay;

import java.util.List;

public interface EssayService {

    int addEssay(Essay essay);
    int deleteEssayById(int id);

    int updateEssay(Essay essay);

    Essay queryEssayById(int id);

    List<Essay> queryAllEssay();

    Essay queryEssayByName( String essayName);

    List<Essay> queryEssayByCategory(String essayCategory);

    List<Essay> queryEssayByDisplayName(String displayName);

}
