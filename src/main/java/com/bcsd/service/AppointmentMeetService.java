package com.bcsd.service;





import com.bcsd.entity.Remeet;
import com.bcsd.entity.UserInternal;

import java.util.List;


public interface AppointmentMeetService {

   //预约本地会议添加
    void appointmentMeet(Remeet remeet,List<UserInternal> user);
    //预约视屏会议
    void appointmentVideoMeet(Remeet remmet,List<UserInternal> user);

    //根据用户Id查询用户预约的会议
    Remeet findRemeet(int userId);


    //根据用户Id查询所有预约的会议
    List<Remeet>  findAll();

    List<Remeet> findPage(int index,int size);


}
