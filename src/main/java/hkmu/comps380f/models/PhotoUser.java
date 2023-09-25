package hkmu.comps380f.models;

import jakarta.persistence.*;
import org.springframework.security.core.GrantedAuthority;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class PhotoUser {

    @Id
    private String username;
    private String password;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserRole> roles = new ArrayList<>();

    private String email;
    private String phoneNumber;

    private String description;
    public PhotoUser(String username, String password, List<GrantedAuthority> roles) {
        this.username = username;
        this.password = password;
        for (GrantedAuthority role : roles) {
            this.roles.add(new UserRole(this, role.getAuthority()));
        }

    }

    public void setAuthority(List<GrantedAuthority> roles){
        this.roles.clear();
        for (GrantedAuthority role : roles) {
            this.roles.add(new UserRole(this, role.getAuthority()));
        }
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getDescription() {
        return description;
    }

    public PhotoUser() {
    }

    public List<UserRole> getRoles() {
        return this.roles;
    }

    public void setRole(List<UserRole> roles) {
        this.roles = roles;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumbers() {
        return this.phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @Override
    public String toString() {
        return "Table User: username = " + username + ", password = " + password + phoneNumber + email;
    }
}
