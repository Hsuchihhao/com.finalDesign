package com.finalDesign.service;

import com.finalDesign.dao.SchoolMapper;
import com.finalDesign.dao.UserMapper;
import com.finalDesign.pojo.School;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

@Service("SchoolService")
public class SchoolServiceImpl  implements SchoolService{

    private SchoolMapper schoolMapper;

    public void setSchoolMapper(SchoolMapper schoolMapper) {
        this.schoolMapper = schoolMapper;
    }

    @Override
    public int addSchool(School school) {
        return schoolMapper.addSchool(school);
    }

    @Override
    public List<School> queryAllSchool() {
        return schoolMapper.queryAllSchool();
    }

    @Override
    public School querySchoolByName(String schoolName) {
        return schoolMapper.querySchoolByName(schoolName);
    }

    @Override
    public School querySchoolById(int id) {
        return schoolMapper.querySchoolById(id);
    }

    @Override
    public int deleteSchoolById(int id) {
        return schoolMapper.deleteSchoolById(id);
    }

}
