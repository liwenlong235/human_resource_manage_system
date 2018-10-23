package com.li.serviceImpl;

import com.li.dao.SalaryDao;
import com.li.entity.Salary;
import com.li.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
@Service("salaryService")
public class SalaryServiceImpl implements SalaryService {
    @Autowired
    private SalaryDao salaryDao;
    @Override
    public void addSalary(Salary salary) {
        salaryDao.addSalary(salary);
    }

    @Override
    public void updateSalary(Salary salary) {
        salaryDao.updateSalary(salary);
    }

    @Override
    public void deleteById(int id) {
        salaryDao.deleteById(id);
    }

    @Override
    public List<Salary> queryByEid(int eId) {
        return salaryDao.queryByEid(eId);
    }

    @Override
    public Salary queryBySid(int sid) {
        return salaryDao.queryBySid(sid);
    }

    @Override
    public List<Salary> querySalaries() {
        return salaryDao.querySalaries();
    }

    @Override
    public Salary queryByEidAndMonth(int eId, int month) {
        return salaryDao.queryByEidAndMonth(eId,month);
    }
}
