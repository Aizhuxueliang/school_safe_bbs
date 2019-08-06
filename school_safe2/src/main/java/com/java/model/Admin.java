package com.java.model;

public class Admin {
    private Integer id;

    private String login;

    private String pwd;
    private Integer author;
    private String authorText;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login == null ? null : login.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

	public Integer getAuthor() {
		return author;
	}

	public void setAuthor(Integer author) {
		this.author = author;
	}

	public String getAuthorText() {
		if(author==1)
			return "管理员";
		if(author==2)
			return "消防员员";
		if(author==3)
			return "教师";
		else
			return "校长";
	}

	public void setAuthorText(String authorText) {
		this.authorText = authorText;
	}
    
    
}