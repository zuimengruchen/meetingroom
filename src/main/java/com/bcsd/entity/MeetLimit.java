package com.bcsd.entity;

/**
 * @author HOEP
 * @data 2019/4/26
 */

public class MeetLimit {
//    权限id
    private Integer id;
//    菜单名称
    private String menuname;
//    是否菜单
    private Integer ismenu;
//    显示
    private Integer according;
//    操作
    private Integer operation;
//    全部
    private Integer all;
//    本部门
    private Integer thisdept;
//    下属部门
    private Integer sddept;
//    本账号
    private Integer thisaccount;

    @Override
    public String toString() {
        return "MeetLimit{" +
                "id=" + id +
                ", menuname='" + menuname + '\'' +
                ", ismenu=" + ismenu +
                ", according=" + according +
                ", operation=" + operation +
                ", all=" + all +
                ", thisdept=" + thisdept +
                ", sddept=" + sddept +
                ", thisaccount=" + thisaccount +
                '}';
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public Integer getIsmenu() {
        return ismenu;
    }

    public void setIsmenu(Integer ismenu) {
        this.ismenu = ismenu;
    }

    public Integer getAccording() {
        return according;
    }

    public void setAccording(Integer according) {
        this.according = according;
    }

    public Integer getOperation() {
        return operation;
    }

    public void setOperation(Integer operation) {
        this.operation = operation;
    }

    public Integer getAll() {
        return all;
    }

    public void setAll(Integer all) {
        this.all = all;
    }

    public Integer getThisdept() {
        return thisdept;
    }

    public void setThisdept(Integer thisdept) {
        this.thisdept = thisdept;
    }

    public Integer getSddept() {
        return sddept;
    }

    public void setSddept(Integer sddept) {
        this.sddept = sddept;
    }

    public Integer getThisaccount() {
        return thisaccount;
    }

    public void setThisaccount(Integer thisaccount) {
        this.thisaccount = thisaccount;
    }
}
