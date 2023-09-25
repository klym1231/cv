package hkmu.comps380f.models;

import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name = "user_roles")
public class UserRole {
    @jakarta.persistence.Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_role_id")
    private Long id;

    @Column(insertable = false, updatable = false)
    private String username;
    private String role;

    @ManyToOne
    @JoinColumn(name = "username")
    private PhotoUser user;

    public UserRole() {
    }

    public UserRole(PhotoUser user, String role) {
        this.user = user;
        this.role = role;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public String getUsername(){
        return this.username;
    }

    public String getRole(){
        return this.role;
    }

    public void setRole(String role){
        this.role = role;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}