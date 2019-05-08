package com.bcsd.service;



import com.bcsd.entity.MeetLimit;
import com.bcsd.entity.MeetLimitUser;

import java.util.List;


/**
 * @author HOEP
 * @data 2019/4/28
 */
public interface MeetLimitService {
    List<MeetLimitUser> findByUser(Integer id);
    List<MeetLimit> findBylimit(Integer id);

}
