package com.bcsd.controller;


import com.bcsd.entity.Dict;
import com.bcsd.entity.Result;
import com.bcsd.service.DictService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/dict")
public class DictController  {

    private String PREFIX = "page/dict";

    @Autowired
    private DictService dictService;


    /**
     * 分页查询
     * @param page 当前页码
     * @param size  每页显示数
     * @return
     */
    @RequestMapping("/findPage")
    public ModelAndView findPage(Integer page,Integer size){
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=5;
        }
        List<Dict> list = dictService.findPage(page, size);
        PageInfo pageInfo = new PageInfo<Dict>(list);
        ModelAndView vm=new ModelAndView();
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName(PREFIX+"/dict_home");
        return vm;
    }

    @RequestMapping("/findByPid")
    public ModelAndView findByPid(Integer page,Integer size,Integer pid){
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=5;
        }
        dictService.findByPid(page, size,pid);
        return null;
    }

    /**
     * 查询字典信息
     * @param dictId
     * @return
     */
    @RequestMapping("/findOne")
    public ModelAndView findOne(@RequestParam(value="dictId") Integer dictId){
        ModelAndView vm=new ModelAndView();
        Dict dict = dictService.findOne(dictId);
        vm.addObject("dict",dict);
        vm.setViewName(PREFIX+"/dict_update");
        return vm;
    }

    /**
     * 修改会议室
     * @param dict
     * @return
     */
    @RequestMapping("/update")
    public String update(Dict dict){
        dictService.update(dict);
        return "redirect:findPage";
    }

    /**
     * 添加会议室
     * @param
     * @return
     */
    @RequestMapping("/add")
    public String add(Dict dict) throws Exception {
        dictService.add(dict);
        return "redirect:findPage";
    }


    /**
     * 删除字典
     * @param dictId
     * @return
     */
    @RequestMapping("/delete")
    public String Method(@RequestParam(value="dictId") int dictId){
        System.out.println(dictId);
        dictService.delete(dictId);
        return "redirect:findPage";
    }




 /* @RequestMapping("/list")
    public ModelAndView list(String condition){
        Page page=new Page();
        Page<Map<String, Object>> list = dictService.list(page, condition);
        return null;
    }*/

    /*@RequestMapping("/dict_add")
    public String deptAddType() {
        return PREFIX + "dict_add.html";
    }


    @RequestMapping("/dict_add_item")
    public String deptAddItem(@RequestParam("dictId") Long dictId, Model model) {
        model.addAttribute("dictTypeId", dictId);
        //model.addAttribute("dictTypeName", ConstantFactory.me().getDictName(dictId));
        return PREFIX + "dict_add_item.html";
    }*/

}
