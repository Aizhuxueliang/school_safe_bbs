package com.java.model;

public class TypeConnection {
    private Integer id;

    private Integer newstypeId;
    private NewsType newstype;
    public NewsType getNewstype() {
		return newstype;
	}

	public void setNewstype(NewsType newstype) {
		this.newstype = newstype;
	}

	private Integer clientId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNewstypeId() {
        return newstypeId;
    }

    public void setNewstypeId(Integer newstypeId) {
        this.newstypeId = newstypeId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }
}