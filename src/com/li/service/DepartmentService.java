package com.li.service;

import com.li.entity.Department;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
public interface DepartmentService {
    public List<Department> queryDepartments();
    public Department queryById(int id);
    public Department queryByName(String name);
    public void add(Department department);
    public void deleteById(int id);
    public void update(Department department);
    public List<Department> queryAll();
    public Department queryById2(int id);
    public Department queryByName2(String dName);
}
