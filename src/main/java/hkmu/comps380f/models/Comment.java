package hkmu.comps380f.models;

import jakarta.persistence.*;

import java.sql.Timestamp;
import java.util.Date;

@Entity
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String username;

    private Date date;

    @Column(name = "photo_id")
    private Long photoId;
    private String description;

    public Comment(){

    }

    public Comment(String commentor, Timestamp ts, Long photoId, String description){
        this.username = commentor;
        this.date = ts;
        this.photoId = photoId;
        this.description = description;

    }
    public void setId(long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public String getUsername() {
        return username;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getPhotoId() {
        return photoId;
    }

    public void setPhotoId(Long photoId) {
        this.photoId = photoId;
    }
}
