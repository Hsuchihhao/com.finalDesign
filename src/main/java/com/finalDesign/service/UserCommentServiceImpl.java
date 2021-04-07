package com.finalDesign.service;


import com.finalDesign.dao.UserCommentMapper;
import com.finalDesign.pojo.UserComment;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("UserComment")
public class UserCommentServiceImpl implements UserCommentService {

    private UserCommentMapper userCommentMapper;

    public void setUserCommentMapper(UserCommentMapper userCommentMapper) {
        this.userCommentMapper = userCommentMapper;
    }


    @Override
    public int addUserComment(UserComment userComment) {
        return userCommentMapper.addUserComment(userComment);
    }

    @Override
    public List<UserComment> queryUserCommentByEssay(String commentEssay) {
        return userCommentMapper.queryUserCommentByEssay(commentEssay);
    }

}
