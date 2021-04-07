package com.finalDesign.service;

import com.finalDesign.pojo.UserComment;

import java.util.List;

public interface UserCommentService {

    int addUserComment(UserComment userComment);

    List<UserComment> queryUserCommentByEssay(String commentEssay);
}
