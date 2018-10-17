package com.li.serviceImpl;

import com.li.dao.EmployeeDao;
import com.li.entity.Employee;
import com.li.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDao employeeDao;
    @Override
    public void addEmpl(Employee employee) {
        employeeDao.addEmpl(employee);
    }

    @Override
    public void deleteById(int id) {
        employeeDao.deleteById(id);
    }

    @Override
    public void updateEmpl(Employee employee) {
        employeeDao.updateEmpl(employee);
    }

    @Override
    public Employee queryById(int id) {
        return employeeDao.queryById(id);
    }

    @Override
    public Employee queryByName(String name) {
        return employeeDao.queryByName(name);
    }

    @Override
    public Employee queryByNameAndPassword(String name, String password) {
        return employeeDao.queryByNameAndPassword(name,password);
    }

    @Override
    public List<Employee> queryEmployees() {
        return employeeDao.queryEmployees();
    }

    @Override
    public List<Employee> querySameDept(int dId) {
        return employeeDao.querySameDept(dId);
    }

    @Override
    public List<Employee> querySamePosition(int dId, int pid) {
        return employeeDao.querySamePosition(dId,pid);
    }
}
