package com.zjt.service.impl;

import com.github.pagehelper.PageHelper;
import com.zjt.entity.TClass;
import com.zjt.mapper.TClassMapper;
import com.zjt.model.QueryTClassList;
import com.zjt.service.TClassService;
import com.zjt.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.util.StringUtil;

import javax.transaction.Transactional;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service("tclassServiceImpl")
public class TClassServiceImpl extends BaseService<TClass> implements TClassService {
    @Autowired
    private TClassMapper tclassMapper;

    @Override
    public List<TClass> queryTClassList(Page<QueryTClassList> page) {
        PageHelper.startPage(page.getPage(), page.getRows());
//        return tclassMapper.queryTClassList(page.getCondition());
        return tclassMapper.selectAll();
    }

    @Transactional
    @Override
    public Map<String, Object> saveOrUpdateTClass(TClass tclass) {
        LinkedHashMap<String,Object> resultMap=new LinkedHashMap<String,Object>();
        if(tclass!=null){
            if(StringUtil.isNotEmpty(tclass.getId())){//编辑
                if(StringUtil.isNotEmpty(tclass.getName())){
                    updateNotNull(tclass);
                    resultMap.put("state","success");
                    resultMap.put("message","修改班级成功");
                    return resultMap;
                }else{
                    resultMap.put("state","fail");
                    resultMap.put("message","修改失败，缺少字段");
                    return resultMap;
                }
            }else{//新建
                if(StringUtil.isNotEmpty(tclass.getName())){
                    tclass.setId(UUID.randomUUID().toString().replaceAll("-",""));
                    saveNotNull(tclass);
                    resultMap.put("state","success");
                    resultMap.put("message","新建班级成功");
                    return resultMap;
                }else{
                    resultMap.put("state","fail");
                    resultMap.put("message","新建失败，缺少字段");
                    return resultMap;
                }
            }
        }else{
            resultMap.put("state","fail");
            resultMap.put("message","失败");
            return resultMap;
        }

    }
}
