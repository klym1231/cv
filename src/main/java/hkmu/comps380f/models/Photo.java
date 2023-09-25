package hkmu.comps380f.models;


import jakarta.persistence.*;
import java.util.Date;
import java.sql.Timestamp;

@Entity
public class Photo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "name")
    private String username;
    private String description;

    private Date date;
    @OneToOne(mappedBy = "photo", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private Attachment attachment;

    public void setDate(Timestamp ts) {
        this.date = ts;
    }

    public Date getDate() {
        return date;
    }

    // getters and setters of all properties
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public Attachment getAttachment() {
        return attachment;
    }

    public void setAttachment(Attachment attachment) {
        this.attachment = attachment;
    }

    public void deleteAttachment() {
        setAttachment(null);
    }

    public void setId(Long id) {
        this.id = id;
    }

}
