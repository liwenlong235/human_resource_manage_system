package com.li.service;

import com.li.entity.Invitation;

import java.util.List;

/**
 * Created by 99234 on 2018/10/14.
 */
public interface InvitationService {
    public void add(Invitation invitation);
    public void update(Invitation invitation);
    public void deleteById(int id);
    public Invitation queryByIid(int iId);
    public Invitation queryByRid(int rId);
    public List<Invitation> queryAll();
}
