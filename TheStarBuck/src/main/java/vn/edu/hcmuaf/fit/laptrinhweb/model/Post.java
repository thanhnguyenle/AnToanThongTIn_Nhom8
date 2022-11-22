package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.Serializable;

public class Post extends AbsModel implements Serializable {
    private String id;
    private String title;
    private String image_url;
    private String post_url;
    private String date;
    private String author;
    private String description;
    private String post_content;

    public Post() {
    }

    @Override
    public String toString() {
        return "Post [title=" + title + ", image_url=" + image_url + ", post_url=" + post_url + ", date=" + date
                + ", author=" + author + ", description=" + description + ", content=" + post_content+"]";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getPost_url() {
        return post_url;
    }

    public void setPost_url(String post_url) {
        this.post_url = post_url;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }
}
