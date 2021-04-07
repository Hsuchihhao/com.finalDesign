package com.finalDesign.dao;

import com.finalDesign.pojo.Admin;

public interface AdminMapper {
   Admin queryAdminByName(String adminName);

   Admin queryAdminByNameAndPassword(String name,String password);
}
