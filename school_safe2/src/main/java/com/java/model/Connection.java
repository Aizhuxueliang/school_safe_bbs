package com.java.model;

public class Connection {
    private Integer id;

    private Integer newsId;

    private Integer clientId;
    private News news;
    public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }
}