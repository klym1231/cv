package hkmu.comps380f.controllers;

import hkmu.comps380f.models.PhotoUser;
import hkmu.comps380f.repositories.UserRepository;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RegisterController {

    @Resource
    private UserRepository uRepo;

    @GetMapping ("/register")
    public String register(){
        return "register";
    }

    @PostMapping("/register")
    public String registerHandler(HttpServletRequest request, HttpSession session, Model model) throws NoSuchAlgorithmException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmation_password = request.getParameter("confirmation_password");
        String phoneNumber = request.getParameter("number");
        String email = request.getParameter("email");

         Boolean error = false;
         if(username.isEmpty()){
             error = true;
             model.addAttribute("username_empty_error", true);
         }
         if(password.isEmpty()){
             error = true;
             model.addAttribute("password_empty_error", true);
         }
         if(confirmation_password.isEmpty()){
             error = true;
             model.addAttribute("confirmation_password_empty_error", true);
         }
         if(phoneNumber.isEmpty()){
             error = true;
             model.addAttribute("phoneNumber_empty_error", true);
         }
         if(email.isEmpty()){
             error = true;
             model.addAttribute("email_empty_error", true);
         }

        if(error == true){
            return "register";
        }
        if(!password.equals(confirmation_password)){
            model.addAttribute("password_not_equal_error", true);
            return "register";
        }

        /// checking if exist username from db
        List<PhotoUser> users = uRepo.findAll();
        if(!users.isEmpty()) {
            for (PhotoUser u : users) {
                if (u.getUsername().equals(username)) {
                    model.addAttribute("username_duplicated_error", true);
                    return "register";
                } else if (u.getEmail().equals(email)){
                    model.addAttribute("email_duplicated_error", true);
                    return "register";
                }  else if (u.getPhoneNumbers().equals(phoneNumber)){
                    model.addAttribute("phone_number_duplicated_error", true);
                    return "register";
                }
            }
        }
        // No Error after checking

        // encode password
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        PhotoUser user = new PhotoUser(username, "{noop}" +password, authorities);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
    System.out.print(user.toString());
        uRepo.save(user);
        model.addAttribute("register_success", true);

        session.setAttribute("name",username);
        return "redirect:/signin?register=success";
        /// set to model and write into db

    }
}
