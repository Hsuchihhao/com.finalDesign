package com.finalDesign.dao;

import com.finalDesign.pojo.School;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SchoolMapper {

    int addSchool(School school);

    List<School> queryAllSchool();

    School querySchoolByName(@Param("schoolName") String schoolName);

    School querySchoolById(int id);
}
