package com.bcsd.entity;

/**
 * @author HOEP
 * @data 2019/4/28
 */
public class MeetLimitUser {
//    用户id
    private Integer id;
//    用户名称
    private String  username;
//    用户部门
    private String deptname;
//    用户邮箱
    private String email;
//    用户电话
    private String tel;
//    用户身份
    private String rolename;

    @Override
    public String toString() {
        return "MeetLimitUser{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", deptname='" + deptname + '\'' +
                ", email='" + email + '\'' +
                ", tel='" + tel + '\'' +
                ", rolename='" + rolename + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}
