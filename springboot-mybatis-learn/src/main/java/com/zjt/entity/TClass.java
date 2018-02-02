package com.zjt.entity;

import javax.persistence.*;

@Table(name = "t_class")
public class TClass {
    /**
     * 班级表主键
     */
    @Id
    private String id;

    /**
     * 班级名称
     */
    private String name;

    /**
     * 获取班级表主键
     *
     * @return id - 班级表主键
     */
    public String getId() {
        return id;
    }

    /**
     * 设置班级表主键
     *
     * @param id 班级表主键
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * 获取班级名称
     *
     * @return name - 班级名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置班级名称
     *
     * @param name 班级名称
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}