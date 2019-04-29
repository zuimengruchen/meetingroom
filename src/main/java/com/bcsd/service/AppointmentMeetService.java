package com.bcsd.service;





import com.bcsd.entity.HistoryMeet;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.User;

import java.util.List;
import java.util.Map;


public interface AppointmentMeetService {

   //预约本地会议添加
    void appointmentMeet(Remeet remeet);
    //预约视屏会议
    void appointmentVideoMeet(Remeet remmet);

    //根据用户Id查询用户预约的会议
    Remeet findRemeet(int userId);


    //根据用户Id查询所有预约的会议
    List<Remeet>  findAll();

    List<Remeet> findPage(int index,int size);


    List<HistoryMeet> findPageHistory(Integer page, Integer size, Integer id);

    List<User> findHistoryUser(Integer page, Integer size, Integer id);
}
