package com.zjt.web;

import com.zjt.entity.TClass;
import com.zjt.model.PageRusult;
import com.zjt.model.QueryTClassList;
import com.zjt.service.TClassService;
import com.zjt.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.util.StringUtil;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tclass")
public class TClassController {

    @Autowired
    @Qualifier("tclassServiceImpl")
    private TClassService tclassService;


    @ResponseBody
    @RequestMapping("/queryTClassList")
    public PageRusult selectByPages(Page<QueryTClassList> page){
        List<TClass> tclassList=tclassService.queryTClassList(page);
        //PageInfo<TClass> pageInfo =new PageInfo<TClass>(tclassList);
        PageRusult<TClass> pageRusult =new PageRusult<TClass>(tclassList);
        pageRusult.setCode(0);
        return pageRusult;
    }

    @ResponseBody
    @RequestMapping("/saveOrUpdateTClass")
    public Map<String,Object> saveOrUpdateTClass(TClass tclass){
        LinkedHashMap<String,Object> resultMap=new LinkedHashMap<String,Object>();
        try {
            return tclassService.saveOrUpdateTClass(tclass);
        }catch (Exception e){
            resultMap.put("state","fail");
            resultMap.put("message","操作失败");
            return resultMap;
        }
    }


    @ResponseBody
    @RequestMapping("/deleteTClass")
    public Map<String,Object> deleteTClass(String id){
        LinkedHashMap<String,Object> resultMap=new LinkedHashMap<String,Object>();
        try {
            if(StringUtil.isNotEmpty(id)){
                tclassService.delete(id);
                resultMap.put("state","success");
                resultMap.put("message","删除班级成功");
                return resultMap;
            }else{
                resultMap.put("state","fail");
                resultMap.put("message","删除班级失败");
                return resultMap;
            }
        }catch (Exception e){
            resultMap.put("state","fail");
            resultMap.put("message","操作异常，删除班级失败");
            return resultMap;
        }
    }



}
