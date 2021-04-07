package com.finalDesign.service;

import com.finalDesign.pojo.Admin;

public interface AdminService {
    Admin queryAdminByName(String adminName);

    Admin queryAdminByNameAndPassword(String name,String password);

}
