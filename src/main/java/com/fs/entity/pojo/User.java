package com.fs.entity.pojo;

import javax.persistence.*;

public class User {
    /**
     * 用户id
     */
    @Id
    private String id;

    /**
     * 用户名字
     */
    private String name;

    /**
     * 密码
     */
    private String password;

    /**
     * 0:男 1:女 2:不详
     */
    private Integer sex;

    /**
     * 获取用户id
     *
     * @return id - 用户id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置用户id
     *
     * @param id 用户id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取用户名字
     *
     * @return name - 用户名字
     */
    public String getName() {
        return name;
    }

    /**
     * 设置用户名字
     *
     * @param name 用户名字
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取0:男 1:女 2:不详
     *
     * @return sex - 0:男 1:女 2:不详
     */
    public Integer getSex() {
        return sex;
    }

    /**
     * 设置0:男 1:女 2:不详
     *
     * @param sex 0:男 1:女 2:不详
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }
}