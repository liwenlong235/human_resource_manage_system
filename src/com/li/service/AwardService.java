package com.li.service;

import com.li.entity.Award;

import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
public interface AwardService {
    public void add(Award award);
    public void update(Award award);
    public void deleteById(int id);
    public Award queryById(int id);
    public List<Award> queryByEId(int eId);
    public List<Award> queryAll();
}
