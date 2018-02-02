package com.zjt.web;

import com.zjt.entity.Teacher;
import com.zjt.model.PageRusult;
import com.zjt.model.QueryTeacherList;
import com.zjt.service2.TeacherService;
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
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    @Qualifier("teacherServiceImpl")
    private TeacherService teacherService;


    @ResponseBody
    @RequestMapping("/queryTeacherList")
    public PageRusult selectByPages(Page<QueryTeacherList> page){
        List<Teacher> teacherList=teacherService.queryTeacherList(page);
        PageRusult<Teacher> pageRusult =new PageRusult<Teacher>(teacherList);
        pageRusult.setCode(0);
        return pageRusult;
    }

    @ResponseBody
    @RequestMapping("/saveOrUpdateTeacher")
    public Map<String,Object> saveOrUpdateTeacher(Teacher teacher){
        LinkedHashMap<String,Object> resultMap=new LinkedHashMap<String,Object>();
        try {
            return teacherService.saveOrUpdateTeacher(teacher);
        }catch (Exception e){
            resultMap.put("state","fail");
            resultMap.put("message","操作失败");
            return resultMap;
        }
    }


    @ResponseBody
    @RequestMapping("/deleteTeacher")
    public Map<String,Object> deleteTeacher(String id){
        LinkedHashMap<String,Object> resultMap=new LinkedHashMap<String,Object>();
        try {
            if(StringUtil.isNotEmpty(id)){
                teacherService.delete(id);
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
