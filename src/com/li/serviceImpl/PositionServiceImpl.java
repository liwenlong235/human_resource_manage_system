package com.li.serviceImpl;

import com.li.dao.PositionDao;
import com.li.entity.Position;
import com.li.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/17.
 */
@Service("positionService")
public class PositionServiceImpl implements PositionService {
    @Autowired
    private PositionDao positionDao;
    @Override
    public void add(Position position) {
        positionDao.add(position);
    }

    @Override
    public void update(Position position) {
        positionDao.update(position);
    }

    @Override
    public void deleteById(int id) {
        positionDao.deleteById(id);
    }

    @Override
    public Position queryByPId(int pId) {
        return positionDao.queryByPId(pId);
    }

    @Override
    public Position queryByName(String name) {
        return positionDao.queryByPName(name);
    }

    @Override
    public List<Position> queryAll() {
        return positionDao.queryAll();
    }

    @Override
    public List<Position> queryByDId(int dId) {
        return positionDao.queryByDId(dId);
    }
}
