package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.Impl.MeetUserServiceImpl;
import com.bcsd.service.MeetUserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @author HOEP
 * @data 2019/4/24
 */
@Controller
@RequestMapping("/user")
public class MeetUserController {

    private String PREFIX = "page/user";

    @Autowired
    private MeetUserService meetUserService;

    @RequestMapping("/findAll")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<MeetUser> all = meetUserService.findAll();
        mv.addObject("meetuserlist", all);
        mv.setViewName("page/meet_user");
        return mv;

    }
    @RequestMapping("/add1")
    public String add1(MeetUser meetUser){

        if (meetUser.getSubofficeid()==1){
            meetUser.setSuboffice("武汉分部");
        }
        else {
            meetUser.setSuboffice("上海分部");
        }
        meetUserService.add(meetUser);
        return "forward:findAll";
    }
    @RequestMapping("/findByid")
    public ModelAndView findByid(@RequestParam(value = "id")String id){
        System.out.println(id);
        ModelAndView mv=new ModelAndView();
        MeetUser byid = meetUserService.findByid(id);
        mv.addObject("meetuser",byid);
        mv.setViewName("page/meet_manager/meet_manager_user_update");
        return mv;
    }
    @RequestMapping("/update")
    public String update(MeetUser meetUser){
        if (meetUser.getSubofficeid()==1){
            meetUser.setSuboffice("武汉分部");
            System.out.println(meetUser.getSuboffice());
        }else
        {meetUser.setSuboffice("上海分部");}

        System.out.println(meetUser);
        meetUserService.update(meetUser);
        return "forward:findAll";
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "id")String id){
        System.out.println(id);
        meetUserService.delete(id);
        return "forward:findAll";
    }

    @RequestMapping("/add")
    public String add(MeetUser meetUser) {
//        String uuid = String.valueOf(UUID.randomUUID());
//        String[] split = uuid.split("-");
//        meetUser.setId(split[2]);
        meetUserService.add(meetUser);
        MeetUserRole meetUserRole = new MeetUserRole();
//        meetUserRole.setRoleid(meetUser.getRolename());
//        meetUserRole.setId(split[1]);
//        meetUserRole.setUserid(meetUser.getId());
        meetUserService.addid(meetUserRole);
        return "forward:findAll";
    }

    /**
     * 查询联系人
     *
     * @param page       当前页码
     * @param size       每页显示数
     * @param internal 联系人
     * @return
     */
    @RequestMapping("findInternal")
    public ModelAndView findInternal(Integer page, Integer size, Integer internal){
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        if (internal==null){
            internal=0;
        }
        ModelAndView vm = new ModelAndView();
        List<UserInternal> list = meetUserService.findInternal(page, size, internal);
        PageInfo pageInfo = new PageInfo<UserInternal>(list);
        vm.addObject("pageInfo", pageInfo);
        if (internal==0){
            vm.setViewName(PREFIX + "/linkman1");
        }
        if (internal==1){
            vm.setViewName(PREFIX + "/linkman2");
        }
        return vm;
    }

  /*
    @RequestMapping("findExternal")
    public ModelAndView findExternal(Integer page, Integer size, Integer internal) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
            internal = 1;

        ModelAndView vm = new ModelAndView();

        List<UserInternal> list = meetUserService.findExternal(page, size, internal);
        PageInfo pageInfo = new PageInfo<UserInternal>(list);
        vm.addObject("pageInfo", pageInfo);
        vm.setViewName(PREFIX + "/linkman2");
        return vm;
    }*/


    /**
     * 添加内部联系人
     * @param internal
     * @return
     */
    @RequestMapping("/addInternal")
    public String addInternal(UserInternal internal) {
        meetUserService.addInternal(internal);
        return "redirect:findInternal";
    }

    /**
     * 添加外部联系人
     * @param internal
     * @return
     */
    @RequestMapping("/addExternal")
    public String addExternal(UserInternal internal) {
        meetUserService.addInternal(internal);
        return "redirect:findInternal";
    }

    /**s
     * 删除联系人
     * @param id
     * @return
     */
    @RequestMapping("/deleteInternal")
    public String deleteInternal(Integer id) {
        meetUserService.deleteInternal(id);
        return "redirect:findInternal";
    }

    /**s
     * 删除联系人
     * @param ids
     * @return
     */
    @RequestMapping("/deleteInternals")
    public String deleteInternal(Integer[] ids) {
        meetUserService.deleteInternal(ids);
        return "redirect:findInternal";
    }



}
