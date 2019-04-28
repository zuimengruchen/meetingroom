package com.bcsd.controller;

import com.bcsd.dao.AddUserDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.User;
import com.bcsd.service.AddUserService;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.MeetUserService;
import com.bcsd.service.ReMeetRoomService;
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
@RequestMapping("/addUser")
public class AddUserController {
    @Autowired
    private AddUserService addUserService;
    @Autowired
    private MeetUserService meetUserService;

    @RequestMapping("addUser")
    public ModelAndView addUser(@Param("remeetId")int remeetId,@Param("userId")String userId){
        //
        System.out.println(remeetId);
        System.out.println(userId);
        String  meetId=String.valueOf(remeetId);
        ModelAndView vm=new ModelAndView();
        addUserService.addUser(userId,meetId);
        vm.addObject("remeetId", meetId);
        vm.setViewName("redirect:findInternal?meetId="+remeetId+"");
        return vm;
    }


    @RequestMapping("findInternal")
    public ModelAndView findInternal(@Param("meetId")int meetId, Integer page, Integer size, Integer internal, String name){
        System.out.println(meetId);
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
        vm.addObject("meetId", meetId);
        vm.setViewName("page/addUser/linkman1");
        return vm;

    }


}
