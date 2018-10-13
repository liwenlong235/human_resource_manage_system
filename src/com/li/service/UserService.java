package com.li.service;

import com.li.entity.User;

import java.util.List;

/**
 * Created by 99234 on 2018/10/11.
 */
public interface UserService {
    public List<User> queryUsers();
    public void addUser(User user);
    public void deleteById(Integer id);
    public void updateUser(User user);
    public User queryByName(String name);
    public User queryByNameAndPassword(String name,String password);
}
