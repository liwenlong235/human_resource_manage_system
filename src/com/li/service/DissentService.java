package com.li.service;

import com.li.entity.Dissent;

import java.util.List;

/**
 * Created by 99234 on 2018/10/23.
 */
public interface DissentService {
    public void add(Dissent dissent);
    public void update(Dissent dissent);
    public void deleteByDId(int dId);
    public Dissent queryByDId(int dId);
    public Dissent queryBySId(int sId);
    public List<Dissent> queryAll();
    public List<Dissent> queryNeedAll(int agree);
}
