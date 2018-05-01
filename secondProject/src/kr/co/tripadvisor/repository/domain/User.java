package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class User {
	private int no;
    private String id;
    private String pass;
    private String name;
    private int birth;
    private String email;
    private String sex;
    private String boardAuth;
    private Date regDate;

    public Integer getNo() {
        return no;
    }
    public void setNo(Integer no) {
        this.no = no;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getBirth() {
        return birth;
    }
    public void setBirth(Integer birth) {
        this.birth = birth;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getBoardAuth() {
        return boardAuth;
    }
    public void setBoardAuth(String boardAuth) {
        this.boardAuth = boardAuth;
    }
    public Date getRegDate() {
        return regDate;
    }
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
}
