package com.finalDesign.service;

import com.finalDesign.dao.AdminMapper;
import com.finalDesign.pojo.Admin;

public class AdminServiceImpl  implements AdminService{

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    private AdminMapper adminMapper;


    @Override
    public Admin queryAdminByName(String adminName) {
        return adminMapper.queryAdminByName(adminName);
    }

    @Override
    public Admin queryAdminByNameAndPassword(String name, String password) {
        return adminMapper.queryAdminByNameAndPassword(name,password);
    }
}
