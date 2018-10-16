package com.li.serviceImpl;

import com.li.dao.CommitRecordDao;
import com.li.entity.CommitRecord;
import com.li.service.CommitRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/14.
 */
@Service("commitRecordService")
public class CommitRecordServiceImpl implements CommitRecordService{
    @Autowired
    private CommitRecordDao commitRecordDao;

    @Override
    public void add(CommitRecord commitRecord) {
        commitRecordDao.add(commitRecord);
    }

    @Override
    public void update(CommitRecord commitRecord) {
        commitRecordDao.update(commitRecord);
    }

    @Override
    public void deleteById(int id) {
        commitRecordDao.deleteById(id);
    }

    @Override
    public CommitRecord queryByCId(int cId) {
        return commitRecordDao.queryByCId(cId);
   }

    @Override
    public List<CommitRecord> queryByRId(int rId) {
        return commitRecordDao.queryByRId(rId);
    }

    @Override
    public List<CommitRecord> queryCommitRecords() {
        return commitRecordDao.queryCommitRecords();
    }
}
