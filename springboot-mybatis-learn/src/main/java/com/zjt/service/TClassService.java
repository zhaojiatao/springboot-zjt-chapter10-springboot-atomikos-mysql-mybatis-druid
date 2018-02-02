package com.zjt.service;

import com.zjt.entity.TClass;
import com.zjt.model.QueryTClassList;
import com.zjt.util.Page;

import java.util.List;
import java.util.Map;

public interface TClassService  extends IService<TClass>{
    public List<TClass> queryTClassList(Page<QueryTClassList> page);

    public Map<String,Object> saveOrUpdateTClass(TClass tclass);


}
