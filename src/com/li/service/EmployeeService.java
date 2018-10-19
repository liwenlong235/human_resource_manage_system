package com.li.service;

import com.li.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
public interface EmployeeService {
    public void addEmpl(Employee employee);
    public void deleteById(int id);
    public void updateEmpl(Employee employee);
    public Employee queryById(int id);
    public Employee queryByRId(int rId);
    public Employee queryByName(String name);
    public Employee queryByNameAndPassword(String name,String password);
    public List<Employee> queryEmployees();
    public List<Employee> querySameDept(int dId);
    public List<Employee> querySamePosition(@Param("dId") int dId, @Param("pId")int pid);
}
