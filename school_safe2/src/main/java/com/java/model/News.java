package com.java.model;

import java.util.Date;

public class News {
    private Integer id;

	private String title;


    private Integer hot;

    private Date intime;

    private int zan;
    private String src;
    private Client client;
    private Integer clientId;
    private  Pages page;
    
   
	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public int getZan() {
		return zan;
	}

	public void setZan(int zan) {
		this.zan = zan;
	}
	
	public Pages getPage() {
		return page;
	}

	public void setPage(Pages page) {
		this.page = page;
	}
	private String img="images/no.jpg";

    private Integer newstypeId;
    private NewsType newstype;
    public NewsType getNewstype() {
		return newstype;
	}

	public void setNewstype(NewsType newstype) {
		this.newstype = newstype;
	}

	private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }


    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }

    public Date getIntime() {
        return intime;
    }

    public void setIntime(Date intime) {
        this.intime = intime;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Integer getNewstypeId() {
        return newstypeId;
    }

    public void setNewstypeId(Integer newstypeId) {
        this.newstypeId = newstypeId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}