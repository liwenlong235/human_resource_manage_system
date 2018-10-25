package com.li.serviceImpl;

import com.li.dao.AwardDao;
import com.li.entity.Award;
import com.li.service.AwardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
@Service("awardService")
public class AwardServiceImpl implements AwardService {
    @Autowired
    private AwardDao awardDao;

    @Override
    public void add(Award award) {
        awardDao.add(award);
    }

    @Override
    public void update(Award award) {
        awardDao.update(award);
    }

    @Override
    public void deleteById(int id) {
        awardDao.deleteById(id);
    }

    @Override
    public Award queryById(int id) {
        return awardDao.queryById(id);
    }

    @Override
    public List<Award> queryByEId(int eId) {
        return awardDao.queryByEId(eId);
    }

    @Override
    public List<Award> queryAll() {
        return awardDao.queryAll();
    }



}
