package com.finalDesign.dao;

import com.finalDesign.pojo.School;
import com.finalDesign.pojo.UserComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserCommentMapper {
    //新增评论
    int addUserComment(UserComment userComment);

    List<UserComment> queryUserCommentByEssay(@Param("commentEssay") String commentEssay);

}
