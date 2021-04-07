package com.finalDesign.service;

import com.finalDesign.pojo.Follow;

import java.util.List;

public interface FollowService {
    int addFollow(Follow follow);

    int deleteFollowByName(Follow follow);

    Follow queryFollowByNameAndEssay(Follow follow);

    List<Follow> queryFollowByName(String name);

}
