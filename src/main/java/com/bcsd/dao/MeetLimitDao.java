package com.bcsd.dao;

import com.bcsd.entity.MeetLimit;
import com.bcsd.entity.MeetLimitUser;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/23
 */
public interface MeetLimitDao {


    List<MeetLimitUser> findByUser(Integer id);
    List<MeetLimit> findBylimit(Integer id);
}
