package com.li.service;

import com.li.entity.Train;

import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
public interface TrainService {
    public void add(Train train);
    public void update(Train train);
    public void deleteById(int id);
    public Train queryById(int id);
    public List<Train> queryByEId(int eId);
    public List<Train> queryAll();
}
