package com.li.serviceImpl;

import com.li.dao.InvitationDao;
import com.li.entity.Invitation;
import com.li.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/14.
 */
@Service("invitationService")
public class InvitationServiceImpl implements InvitationService{
    @Autowired
    private InvitationDao invitationDao;
    @Override
    public void add(Invitation invitation) {
        invitationDao.add(invitation);
    }

    @Override
    public void update(Invitation invitation) {
        invitationDao.update(invitation);
    }

    @Override
    public void deleteById(int id) {
        invitationDao.deleteById(id);
    }

    @Override
    public Invitation queryByIid(int iId) {
        return invitationDao.queryByIid(iId);
    }

    @Override
    public Invitation queryByRid(int rId) {
        return invitationDao.queryByRid(rId);
    }

    @Override
    public List<Invitation> queryAll() {
        return invitationDao.queryAll();
    }
}
