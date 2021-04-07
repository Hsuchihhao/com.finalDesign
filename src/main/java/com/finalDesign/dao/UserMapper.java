package com.finalDesign.dao;

import com.finalDesign.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int addUser(User user);

    int deleteUserById(@Param("userId") int id);

    int updateUser(User user);

    User queryUserById(int id);

    List<User> queryAllUser();

    User queryUserByName(@Param("userName") String userName);

    public User findUserByNameAndPassword(User user);

    public User findUserByName(User user);


    public User findUserByDisplayName(User user);


}
