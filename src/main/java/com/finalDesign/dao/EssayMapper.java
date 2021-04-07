package com.finalDesign.dao;

import com.finalDesign.pojo.Essay;
import com.finalDesign.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EssayMapper {
    int addEssay(Essay essay);

    int deleteEssayById(@Param("essayId") int id);

    int updateEssay(Essay essay);

    Essay queryEssayById(int id);

    List<Essay> queryAllEssay();

    Essay queryEssayByName(@Param("essayName") String essayName);

    List<Essay> queryEssayByCategory(@Param("essayCategory") String essayCategory);

    List<Essay> queryEssayByDisplayName(String displayName);


}
