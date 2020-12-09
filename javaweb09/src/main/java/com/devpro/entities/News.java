package com.devpro.entities;



import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "news")
public class News extends BaseEntity {

	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoryid") // tên field khoá ngoại
	private Category category;
	
	@Column(name = "title", nullable = true)
	private String title;
	
	@Column(name = "thumbnail", nullable = true, columnDefinition = "longtext")
	private String thumbnail;
	
	@Lob
	@Column(name = "shortdescription", nullable = true, columnDefinition = "text")
	private String shortDescription;
	
	@Lob
	@Column(name = "content", nullable = true, columnDefinition = "longtext")
	private String content;
	
	// 1 category -> N products
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "news", fetch = FetchType.LAZY)
	private List<Comment> listNews = new ArrayList<Comment>();

	public void addComment(Comment comment) {
		listNews.add(comment);
		comment.setNews(this);
	}

	public void removeComment(Comment comment) {
		listNews.remove(comment);
		comment.setNews(null);
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
