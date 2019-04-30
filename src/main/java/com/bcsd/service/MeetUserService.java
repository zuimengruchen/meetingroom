package com.bcsd.service;

import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/24
 */
public interface MeetUserService {
    List<MeetUser> findAll();
    void add(MeetUser meetUser);
    void addid(MeetUserRole meetUserRole);
    MeetUser findByid(String Id);
    void update(MeetUser meetUser);
    void delete(String id);

    public List<UserInternal> findInternal(Integer page, Integer size, Integer internal);
   // public List<UserInternal> findExternal(Integer page, Integer size, Integer internal);

    void addInternal(UserInternal internal);

    void deleteInternal(Integer id);
    void deleteInternal(Integer[] ids);


}
