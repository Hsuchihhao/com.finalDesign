package com.finalDesign.service;

import com.finalDesign.dao.UserMapper;
import com.finalDesign.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService{

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public int addUser(User user) {

        return userMapper.addUser(user);
    }

    @Override
    public int deleteUserById(int id) {
        return userMapper.deleteUserById(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public User queryUserByName(String userName) {
        return userMapper.queryUserByName(userName);
    }

    public User findUserByNameAndPassword(User user){
      User userinfo= userMapper.findUserByNameAndPassword(user);
    return  userinfo;
    }

    public User findUserByName(User user){
        return userMapper.findUserByName(user);
    }

    @Override
    public User findUserByDisplayName(User user) {
        return userMapper.findUserByDisplayName(user);
    }


}
