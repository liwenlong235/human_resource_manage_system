package com.li.serviceImpl;

import com.li.dao.UserDao;
import com.li.entity.User;
import com.li.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import java.util.List;

/**
 * Created by 99234 on 2018/10/11.
 */
@Service("userService")
public class UserServiceImpl implements UserService{
    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;

    @Override
    public List<User> queryUsers() {
        return userDao.queryUsers();
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public void deleteById(Integer id) {
        userDao.deleteById(id);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public User queryByName(String name) {
        return userDao.queryByName(name);
    }

    @Override
    public User queryByNameAndPassword(String name, String password) {
        return userDao.queryByNameAndPassword(name,password);
    }
}
