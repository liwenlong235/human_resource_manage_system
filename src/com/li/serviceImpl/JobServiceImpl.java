package com.li.serviceImpl;

import com.li.dao.JobDao;
import com.li.entity.Job;
import com.li.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
@Service("jobService")
public class JobServiceImpl implements JobService {
    @Autowired
    private JobDao jobDao;
    @Override
    public void addJob(Job job) {
        jobDao.addJob(job);
    }

    @Override
    public void updateJob(Job job) {
        jobDao.updateJob(job);
    }

    @Override
    public void deleteByJId(int jId) {
        jobDao.deleteByJId(jId);
    }

    @Override
    public Job queryByJId(int jId) {
        return jobDao.queryByJId(jId);
    }

    @Override
    public List<Job> queryJobs() {
        return jobDao.queryJobs();
    }
}
