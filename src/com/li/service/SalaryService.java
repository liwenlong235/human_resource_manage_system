package com.li.service;

import com.li.entity.Salary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
public interface SalaryService {
    public void addSalary(Salary salary);
    public void updateSalary(Salary salary);
    public void deleteById(int id);
    public List<Salary> queryByEid(int eId);
    public Salary queryBySid(int sid);
    public List<Salary> querySalaries();
    public Salary queryByEidAndMonth(int eId,int month);
}
