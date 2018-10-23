package com.li.serviceImpl;

import com.li.dao.DissentDao;
import com.li.entity.Department;
import com.li.entity.Dissent;
import com.li.service.DepartmentService;
import com.li.service.DissentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/23.
 */
@Service("dissentService")
public class DissentServiceImpl implements DissentService {
    @Autowired
    private DissentDao dissentDao;
    @Override
    public void add(Dissent dissent) {
        dissentDao.add(dissent);
    }

    @Override
    public void update(Dissent dissent) {
        dissentDao.update(dissent);
    }

    @Override
    public void deleteByDId(int dId) {
        dissentDao.deleteByDId(dId);
    }

    @Override
    public Dissent queryByDId(int dId) {
        return dissentDao.queryByDId(dId);
    }

    @Override
    public Dissent queryBySId(int sId) {
        return dissentDao.queryBySId(sId);
    }

    @Override
    public List<Dissent> queryAll() {
        return dissentDao.queryAll();
    }

    @Override
    public List<Dissent> queryNeedAll(int agree) {
        return dissentDao.queryNeedAll(agree);
    }
}
