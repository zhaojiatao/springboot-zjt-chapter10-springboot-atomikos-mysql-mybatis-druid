package com.zjt.web;


import com.zjt.service3.JtaTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.LinkedHashMap;
import java.util.Map;

@Controller
@RequestMapping("/jtaTest")
public class JtaTestContoller {

    @Autowired
    @Qualifier("jtaTestServiceImpl")
    private JtaTestService taTestService;



    @ResponseBody
    @RequestMapping("/test01")
    public Map<String,Object> test01(){
        LinkedHashMap<String,Object> resultMap=new LinkedHashMap<String,Object>();
        try {
            return taTestService.test01();
        }catch (Exception e){
            resultMap.put("state","fail");
            resultMap.put("message","分布式事务同步失败");
            return resultMap;
        }
    }






}
