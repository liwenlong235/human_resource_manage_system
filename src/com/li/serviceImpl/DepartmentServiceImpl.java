package com.li.serviceImpl;

import com.li.dao.DepartmentDao;
import com.li.entity.Department;
import com.li.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentDao departmentDao;
    @Override
    public List<Department> queryDepartments() {
        return departmentDao.queryDepartments();
    }

    @Override
    public Department queryById(int id) {
        return departmentDao.queryById(id);
    }

    @Override
    public Department queryByName(String name) {
        return departmentDao.queryByName(name);
    }

    @Override
    public void add(Department department) {
        departmentDao.add(department);
    }

    @Override
    public void deleteById(int id) {
        departmentDao.deleteById(id);
    }

    @Override
    public void update(Department department) {
        departmentDao.update(department);
    }

    @Override
    public List<Department> queryAll() {
        return departmentDao.queryAll();
    }

    @Override
    public Department queryById2(int id) {
        return departmentDao.queryById2(id);
    }

    @Override
    public Department queryByName2(String dName) {
        return departmentDao.queryByName2(dName);
    }
}
