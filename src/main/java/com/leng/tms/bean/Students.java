package com.leng.tms.bean;

public class Students {

    private String no;

    private String name;

    private int age;

    private String sex;

    private String stuclass;

    private String dormitory;

    private int cscore; //C程序设计成绩

    private int osscore; //操作系统成绩

    private int ciscore; //计算机网络成绩

    private int sescore; //软件工程成绩

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getStuclass() {
        return stuclass;
    }

    public void setStuclass(String stuclass) {
        this.stuclass = stuclass;
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public int getCscore() {
        return cscore;
    }

    public void setCscore(int cscore) {
        this.cscore = cscore;
    }

    public int getOsscore() {
        return osscore;
    }

    public void setOsscore(int osscore) {
        this.osscore = osscore;
    }

    public int getCiscore() {
        return ciscore;
    }

    public void setCiscore(int ciscore) {
        this.ciscore = ciscore;
    }

    public int getSescore() {
        return sescore;
    }

    public void setSescore(int sescore) {
        this.sescore = sescore;
    }
}
