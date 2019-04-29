package com.bcsd.controller;

import com.bcsd.dao.AddUserDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.*;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/appointreet")
public class AppointmrntController {

    @Autowired
    private AppointmentMeetService appointmentMeetService;
    @Autowired
    @Qualifier("reMeetRoomService")
    private ReMeetRoomService reMeetRoomService;
    @Autowired
    private MeetUserService meetUserService;
    @Autowired
    private AddUserService addUserService;


    @RequestMapping("videoremeet")
    public ModelAndView video(@Param("id")String id, @RequestParam(value = "date")String date, @RequestParam(value = "time")String time,
                              @RequestParam(value = "duration")String duration){
        String datetime =date.trim()+" "+time.trim();
        ModelAndView vm=new ModelAndView();
        MeetRoom meetRoom=reMeetRoomService.findById(id);
        vm.addObject("datetime",datetime);
        vm.addObject("duration",duration);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName("page/videomeet");
        return vm;
    }

    @RequestMapping("findInternal")
    public ModelAndView findInternal(Integer page, Integer size, Integer internal, String name){
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 5;
        }
        if (internal == null || internal != 1) {
            internal = 0;
        }
        if (name == null) {
            name = "";
        }
        ModelAndView vm = new ModelAndView();
        List<User> list = meetUserService.findInternal(page, size, 0, name);
        //PageInfo pageInfo = new PageInfo<>(list);
        vm.addObject("Internal", list);
        vm.setViewName("page/addUser/linkman1");
        return vm;
    }







    @RequestMapping("myappointmeet")
    public ModelAndView myappointmeet(Integer page,Integer size){
        if(page==null||page==0){
            page=1;
        }
        if(size==null||size==0){
            size=10;
        }
        ModelAndView vm=new ModelAndView();
        List<Remeet> meets=appointmentMeetService.findPage(page,size);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meettable");
        return vm;
    }

}
