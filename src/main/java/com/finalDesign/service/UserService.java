package com.finalDesign.service;

import com.finalDesign.pojo.Books;
import com.finalDesign.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {

    int addUser(User user);

    int deleteUserById( int id);

    int updateUser(User user);

    User queryUserById(int id);

    List<User> queryAllUser();

    User queryUserByName( String userName);

    User findUserByNameAndPassword(User user);

    User findUserByName(User user);

    public User findUserByDisplayName(User user);
}
