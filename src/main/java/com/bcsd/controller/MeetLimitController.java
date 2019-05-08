package com.bcsd.controller;




import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.MeetLimitUser;
import com.bcsd.service.Impl.MeetLimitServiceImpl;
import com.bcsd.service.MeetDeptService;
import com.bcsd.service.MeetLimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/28
 */
@Controller
@RequestMapping("limit")
public class MeetLimitController {
    @Autowired
    private MeetLimitService meetLimitService;


    @RequestMapping(value="/findbyuser",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetbuilding(@RequestParam(value="id")Integer id){


        String result = JSONObject.toJSONString(meetLimitService.findByUser(id));
        return result;
    }

    @RequestMapping(value="/findBylimit",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object findBylimit(@RequestParam(value="id")Integer id){
        String result = JSONObject.toJSONString(meetLimitService.findBylimit(id));
        return result;
    }

}
