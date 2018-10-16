package com.li.service;

import com.li.entity.Job;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
public interface JobService {
    public void addJob(Job job);
    public void updateJob(Job job);
    public void deleteByJId(int jId);
    public Job queryByJId(int jId);
    public List<Job> queryJobs();
}
