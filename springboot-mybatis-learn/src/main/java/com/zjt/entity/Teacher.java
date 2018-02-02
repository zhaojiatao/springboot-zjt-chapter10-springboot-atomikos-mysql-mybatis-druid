package com.zjt.entity;

import javax.persistence.*;

@Table(name = "t_teacher")
public class Teacher {
    /**
     * 班主任id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 获取班主任id
     *
     * @return id - 班主任id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置班主任id
     *
     * @param id 班主任id
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * 获取姓名
     *
     * @return name - 姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置姓名
     *
     * @param name 姓名
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}