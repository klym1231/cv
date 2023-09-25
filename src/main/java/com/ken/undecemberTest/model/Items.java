package com.ken.undecemberTest.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ITEMS")
public class Items {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    
    private Integer level;
    
    private String position;

    //private List<String> content = new ArrayList<>();
    private String content1;
    private String content2;
    private String content3;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getLevel() {
        return level;
    }
    public void setLevel(Integer level) {
        this.level = level;
    }
    
    public String getPosition() {
        return position;
    }
    public void setPosition(String position) {
        this.position = position;
    }


    public String getContent1() {
        return content1;
    }
    public void setContent1(String content1) {
        this.content1 = content1;
    }
    public String getContent2() {
        return content2;
    }
    public void setContent2(String content2) {
        this.content2 = content2;
    }
    public String getContent3() {
        return content3;
    }
    public void setContent3(String content3) {
        this.content3 = content3;
    }
    
}
