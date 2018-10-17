package com.li.serviceImpl;

import com.li.dao.ManagerDao;
import com.li.entity.Manager;
import com.li.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;
    @Override
    public void add(Manager manager) {
        managerDao.add(manager);
    }

    @Override
    public void update(Manager manager) {
        managerDao.update(manager);
    }

    @Override
    public void deleteById(int id) {
        managerDao.deleteById(id);
    }

    @Override
    public Manager queryById(int id) {
        return managerDao.queryById(id);
    }

    @Override
    public Manager queryByName(String name) {
        return managerDao.queryByName(name);
    }

    @Override
    public Manager queryByNameAndPassword(String name, String password) {
        return managerDao.queryByNameAndPassword(name,password);
    }

    @Override
    public List<Manager> queryAll() {
        return managerDao.queryAll();
    }
}
