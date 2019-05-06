package com.bcsd.service.Impl;

import com.bcsd.dao.MeetDeptDao;
import com.bcsd.dao.MeetLimitDao;


import com.bcsd.entity.MeetLimit;
import com.bcsd.entity.MeetLimitUser;
import com.bcsd.service.MeetLimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author HOEP
 * @data 2019/4/28
 */
@Service("meetLimitService")
public class MeetLimitServiceImpl implements MeetLimitService {
    @Autowired
    private MeetLimitDao meetLimitDao;

    /*@Autowired
    private MeetDeptDao meetDeptDao;*/

    @Override
    public List<MeetLimitUser> findByUser(Integer id) {
        List<MeetLimitUser> byUser = meetLimitDao.findByUser(id);
        return byUser;
    }

    @Override
    public List<MeetLimit> findBylimit(Integer id) {
        List<MeetLimit> bylimit = meetLimitDao.findBylimit(id);
        return bylimit;
    }
}
