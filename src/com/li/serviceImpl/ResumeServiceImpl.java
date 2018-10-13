package com.li.serviceImpl;

import com.li.dao.ResumeDao;
import com.li.entity.Resume;
import com.li.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
@Service("resumeService")
public class ResumeServiceImpl implements ResumeService{
    @Autowired
    private ResumeDao resumeDao;
    @Override
    public void addResume(Resume resume) {
        resumeDao.addResume(resume);
    }

    @Override
    public void updateResume(Resume resume) {
        resumeDao.updateResume(resume);
    }

    @Override
    public void deleteById(int id) {
        resumeDao.deleteById(id);
    }

    @Override
    public Resume queryById(int id) {
        return resumeDao.queryById(id);
    }

    @Override
    public List<Resume> queryResumes() {
        return resumeDao.queryResumes();
    }
}
