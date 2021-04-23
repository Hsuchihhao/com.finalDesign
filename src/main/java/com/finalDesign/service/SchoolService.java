package com.finalDesign.service;

import com.finalDesign.pojo.School;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SchoolService {

    int addSchool(School school);

    List<School> queryAllSchool();

    School querySchoolByName(String schoolName);

    School querySchoolById(int id);

    int deleteSchoolById( int id);
}
