package com.zjt.service2;

import com.zjt.entity.Teacher;
import com.zjt.model.QueryTeacherList;
import com.zjt.service.IService;
import com.zjt.util.Page;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

public interface TeacherService extends IService<Teacher>{
    public List<Teacher> queryTeacherList(Page<QueryTeacherList> page);

    public Map<String,Object> saveOrUpdateTeacher(Teacher teacher);


}
