package com.li.service;

import com.li.entity.Position;

import java.util.List;

/**
 * Created by 99234 on 2018/10/17.
 */
public interface PositionService {
    public void add(Position position);
    public void update(Position position);
    public void deleteById(int id);
    public Position queryByPId(int pId);
    public Position queryByName(String name);
    public List<Position> queryAll();
    public List<Position> queryByDId(int dId);
}
