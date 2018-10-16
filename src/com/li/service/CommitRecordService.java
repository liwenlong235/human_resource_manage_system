package com.li.service;

import com.li.entity.CommitRecord;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/14.
 */
public interface CommitRecordService {
    public void add(CommitRecord commitRecord);
    public void update(CommitRecord commitRecord);
    public void deleteById(int id);
    public CommitRecord queryByCId(int cId);
    public List<CommitRecord> queryByRId(int rId);
    public CommitRecord queryByRIdAndJId(int rId,int jId);
    public List<CommitRecord> queryCommitRecords();
}
