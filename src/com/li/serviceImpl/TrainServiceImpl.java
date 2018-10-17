package com.li.serviceImpl;

import com.li.dao.TrainDao;
import com.li.entity.Train;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
@Service("trainService")
public class TrainServiceImpl implements com.li.service.TrainService {
    @Autowired
    private TrainDao trainDao;
    @Override
    public void add(Train train) {
        trainDao.add(train);
    }

    @Override
    public void update(Train train) {
        trainDao.update(train);
    }

    @Override
    public void deleteById(int id) {
        trainDao.deleteById(id);
    }

    @Override
    public Train queryById(int id) {
        return trainDao.queryById(id);
    }

    @Override
    public List<Train> queryByEId(int eId) {
        return trainDao.queryByEId(eId);
    }

    @Override
    public List<Train> queryAll() {
        return trainDao.queryAll();
    }
}
