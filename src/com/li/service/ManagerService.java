package com.li.service;

import com.li.entity.Manager;

import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
public interface ManagerService {
    public void add(Manager manager);
    public void update(Manager manager);
    public void deleteById(int id);
    public Manager queryById(int id);
    public Manager queryByName(String name);
    public Manager queryByNameAndPassword(String name,String password,int type);
    public List<Manager> queryAll();
}
