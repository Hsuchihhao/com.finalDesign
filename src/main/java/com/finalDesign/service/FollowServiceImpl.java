package com.finalDesign.service;

import com.finalDesign.dao.FollowMapper;
import com.finalDesign.pojo.Follow;

import java.util.List;

public class FollowServiceImpl implements FollowService{

    public void setFollowMapper(FollowMapper followMapper) {
        this.followMapper = followMapper;
    }

    private FollowMapper followMapper;

    @Override
    public int addFollow(Follow follow) {
        return followMapper.addFollow(follow);
    }

    @Override
    public int deleteFollowByName(Follow follow) {
        return followMapper.deleteFollowByName(follow);
    }

    @Override
    public Follow queryFollowByNameAndEssay(Follow follow) {
        return followMapper.queryFollowByNameAndEssay(follow);
    }

    @Override
    public List<Follow> queryFollowByName(String name) {
        return followMapper.queryFollowByName(name);
    }
}
