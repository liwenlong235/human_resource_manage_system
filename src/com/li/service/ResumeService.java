package com.li.service;

import com.li.entity.Resume;

import java.util.List;

/**
 * Created by 99234 on 2018/10/13.
 */
public interface ResumeService {
    public void addResume(Resume resume);
    public void updateResume(Resume resume);
    public void deleteById(int id);
    public Resume queryById(int id);
    public Resume queryByUserId(int userId);
    public List<Resume> queryResumes();
}
