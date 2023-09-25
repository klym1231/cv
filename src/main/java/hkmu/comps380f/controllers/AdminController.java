package hkmu.comps380f.controllers;


import hkmu.comps380f.dao.CommentService;
import hkmu.comps380f.dao.PhotoService;
import hkmu.comps380f.dao.UserService;
import hkmu.comps380f.exception.PhotoNotFound;
import hkmu.comps380f.models.Comment;
import hkmu.comps380f.models.Photo;
import hkmu.comps380f.models.PhotoUser;
import hkmu.comps380f.models.UserRole;
import hkmu.comps380f.repositories.CommentRepository;
import hkmu.comps380f.repositories.UserRepository;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private UserService uService;

    @Resource
    private UserRepository uRepo;
    @Resource
    private PhotoService pService;
    @Resource
    private CommentService cService;
    @Resource
    private CommentRepository cRepo;
    @GetMapping("/")
    public Boolean isUserExisted(Principal principal){
        Boolean exist = false;
        List<PhotoUser> users = uRepo.findAll();
        for(PhotoUser u: users){
            if(u.getUsername().equals(principal.getName())){
                exist = true;
            }
        }
        return exist;
    }
    public Boolean isRoleAdminExisted(Principal principal){
        Boolean ROLE_ADMIN = false;
        PhotoUser user = uRepo.findById(principal.getName()).orElse(null);

        for(UserRole userRole: user.getRoles()){
            if(userRole.getRole().equals("ROLE_ADMIN")){
                ROLE_ADMIN = true;
            }
        }
        return ROLE_ADMIN;
    }

    @GetMapping ("/users")
    public ModelAndView users(HttpServletRequest request, Principal principal){
        if(!isUserExisted(principal) || !isRoleAdminExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }
        ModelAndView modelAndView = new ModelAndView("admin-users");
        List<PhotoUser> users = uRepo.findAll();
        modelAndView.addObject("Users", users);
        modelAndView.addObject("add", request.getParameter("add"));
        modelAndView.addObject("delete", request.getParameter("delete"));
        return modelAndView;
    }



    public static class UserForm {

        private String username;
        private String password;

        private List<String> roles = new ArrayList<>();

        private String email;
        private String phoneNumber;

        private String description;

        public String getDescription() {
            return description;
        }

        public String getPhoneNumber() {
            return phoneNumber;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getUsername() {
            return username;
        }

        public List<String> getRoles() {
            return roles;
        }

        public String getEmail() {
            return email;
        }

        public String getPassword() {
            return password;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public void setPhoneNumber(String phoneNumber) {
            this.phoneNumber = phoneNumber;
        }

        public void setRoles(List<String> roles) {
            this.roles = roles;
        }
    }

    @GetMapping("/users/add")
    public ModelAndView addUserPage(Principal principal){
        if(!isUserExisted(principal) || !isRoleAdminExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }
        AdminController.UserForm form = new AdminController.UserForm();
        ModelAndView mav = new ModelAndView("admin-users-add");
        mav.addObject("userForm", form);
        return mav;
    }
    @GetMapping("/users/{username}")
    public ModelAndView viewUserDetail(@PathVariable("username") String username, Principal principal) throws PhotoNotFound {
        if(!isUserExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }
        ModelAndView mav = new ModelAndView("admin-user-comments");
        List<Comment> comments = cRepo.findAllByUsernameDesc(username);
        PhotoUser user = uRepo.findById(username).orElse(null);
//        for(Comment c: comments){
//            HashMap<String, String> map = new HashMap<>();
//            Photo photo = pService.getPhoto(c.getPhotoId());
//            map.put("author", photo.getUsername());
//            map.put("description", photo.getDescription());
//        }
        mav.addObject("CommentHistory", comments);
        mav.addObject("User", user);
//        mav.addObject("CommentedPhoto", map);
        return mav;
    }

    @GetMapping("/users/edit/{username}")
    public ModelAndView editUserPage(Principal principal,@PathVariable("username") String username){
        if(!isUserExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }
        PhotoUser user = uRepo.findById(username).orElse(null);
        AdminController.UserForm form = new AdminController.UserForm();
        ModelAndView mav = new ModelAndView("admin-users-edit");
        mav.addObject("userForm", form);
        mav.addObject("User", user);
        return mav;
    }



    @GetMapping("/photo_history")
    public ModelAndView viewPhotoHistory(Principal principal){
        if(!isUserExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }
        ModelAndView mav = new ModelAndView("admin-photo-history");
        List<Photo> photoList = pService.getPhotos();
        List<Map<String, String>> map = new ArrayList<>();
        for(Photo p: photoList){
            if(p.getAttachment() != null) {
                Map<String, String> m = new HashMap<>();
                String base64Img = Base64.getEncoder().encodeToString(p.getAttachment().getContents());
                m.put("username", p.getUsername());
                m.put("id", String.valueOf(p.getId()));
                m.put("src", base64Img);
                m.put("description", p.getDescription());
                m.put("date",p.getDate().toString());
                map.add(m);
            }
        }
        mav.addObject("photoList", map);
        return mav;
    }

    @PostMapping("/users/delete")
    public ModelAndView deleteUser(HttpServletRequest request, Principal principal, Model model){
        ModelAndView mav = new ModelAndView();

        String username = request.getParameter("username");
        System.out.println(username);
        System.out.println(principal.getName());
        mav.setView(new RedirectView("/admin/users"));
        if(username.equals(principal.getName())){
            mav.addObject("delete", "fail");

            return mav;
        }
        cService.delete(username);
        pService.delete(username);
        uRepo.deleteById(username);
        mav.addObject("delete", "success");
        return mav;
    }

    @PostMapping("/users/edit/{username}")
    public String editUser(@PathVariable("username") String username, @ModelAttribute("userForm") UserForm form, Model model){
        Boolean error = false;
        if(form.getUsername().isEmpty()){
            error = true;
            model.addAttribute("username_empty_error", true);
        }
        if(form.getPhoneNumber().isEmpty()){
            error = true;
            model.addAttribute("phoneNumber_empty_error", true);
        }
        if(form.getEmail().isEmpty()){
            error = true;
            model.addAttribute("email_empty_error", true);
        }

        if(error == true){
            return "admin-users-add";
        }

        /// checking if exist username from db
        List<PhotoUser> users = uRepo.findAll();
        if(!users.isEmpty()) {
            for (PhotoUser u : users) {
                if(!u.getUsername().equals(username)) {
                    if (u.getEmail().equals(form.getEmail())) {
                        model.addAttribute("email_duplicated_error", true);
                        return "admin-users-add";
                    } else if (u.getPhoneNumbers().equals(form.getPhoneNumber())) {
                        model.addAttribute("phone_number_duplicated_error", true);
                        return "admin-users-add";
                    }
                }
            }
        }

        List<GrantedAuthority> authorities = new ArrayList<>();

        for(String role: form.getRoles()){
            authorities.add(new SimpleGrantedAuthority(role));
        }
        PhotoUser original_user = uRepo.findById(username).orElse(null);
        if(!form.getPassword().equals("")){
            original_user.setPassword("{noop}" + form.getPassword());
        }
        original_user.setAuthority(authorities);
        original_user.setEmail(form.getEmail());
        original_user.setPhoneNumber(form.getPhoneNumber());
        uRepo.save(original_user);

        return "redirect:/admin/users?register=success";
    }

    @PostMapping("/users/add")
    public String addUser(@ModelAttribute("userForm") UserForm form, Model model){
        Boolean error = false;
        if(form.getUsername().isEmpty()){
            error = true;
            model.addAttribute("username_empty_error", true);
        }
        if(form.getPassword().isEmpty()){
            error = true;
            model.addAttribute("password_empty_error", true);
        }
        if(form.getPhoneNumber().isEmpty()){
            error = true;
            model.addAttribute("phoneNumber_empty_error", true);
        }
        if(form.getEmail().isEmpty()){
            error = true;
            model.addAttribute("email_empty_error", true);
        }

        if(error == true){
            return "admin-users-add";
        }

        /// checking if exist username from db
        List<PhotoUser> users = uRepo.findAll();
        if(!users.isEmpty()) {
            for (PhotoUser u : users) {
                if (u.getUsername().equals(form.getUsername())) {
                    model.addAttribute("username_duplicated_error", true);
                    return "admin-users-add";
                } else if (u.getEmail().equals(form.getEmail())){
                    model.addAttribute("email_duplicated_error", true);
                    return "admin-users-add";
                }  else if (u.getPhoneNumbers().equals(form.getPhoneNumber())){
                    model.addAttribute("phone_number_duplicated_error", true);
                    return "admin-users-add";
                }
            }
        }

        List<GrantedAuthority> authorities = new ArrayList<>();

        for(String role: form.getRoles()){
            authorities.add(new SimpleGrantedAuthority(role));
        }
        PhotoUser user = new PhotoUser(form.getUsername(), "{noop}" +form.getPassword(), authorities);
        user.setEmail(form.getEmail());
        user.setPhoneNumber(form.getPhoneNumber());
        System.out.print(user.toString());
        uRepo.save(user);
        return "redirect:/admin/users?add=success";
    }

    /*
        @GetMapping ("/dashboard")
        public ModelAndView dashboard (Principal principal) {
            if(!isUserExisted(principal) || !isRoleAdminExisted(principal)){
                ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
                return mav;
            }
            ModelAndView modelAndView = new ModelAndView("admin-dashboard");
            return modelAndView;
        }
    */


    @GetMapping("/photos")
    public ModelAndView photos (Principal principal) {
        if(!isUserExisted(principal) || !isRoleAdminExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }
        ModelAndView modelAndView = new ModelAndView("admin-photos");
        List<Photo> photoList = pService.getPhotos();
        List<Map<String, String>> map = new ArrayList<>();
        for(Photo p: photoList){
            if(p.getAttachment() != null) {
                Map<String, String> m = new HashMap<>();
                String base64Img = Base64.getEncoder().encodeToString(p.getAttachment().getContents());
                m.put("username", p.getUsername());
                m.put("id", String.valueOf(p.getId()));
                m.put("src", base64Img);
                m.put("description", p.getDescription());
                m.put("date",p.getDate().toString());
                map.add(m);
            }
        }
        modelAndView.addObject("photoList", map);
        return modelAndView;
    }

    @PostMapping("/photos/delete/{photoId}")
    public ModelAndView photoDelete(Principal principal, @PathVariable("photoId") Long photoId) throws PhotoNotFound {
        if(!isUserExisted(principal) || !isRoleAdminExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }

        ModelAndView modelAndView = new ModelAndView(new RedirectView("/admin/photos"));
        pService.delete(photoId);
        return modelAndView;
    }
    @GetMapping("/comments")
    public ModelAndView comments (Principal principal) {
        if(!isUserExisted(principal) || !isRoleAdminExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }
        ModelAndView modelAndView = new ModelAndView("admin-comments");
        List<Comment> comments = cRepo.findAll();
        modelAndView.addObject("comments", comments);
        return modelAndView;
    }

    @PostMapping("/comments/delete/{commentId}")
    public ModelAndView deleteComment(Principal principal, @PathVariable("commentId") Long commentId){
        if(!isUserExisted(principal) || !isRoleAdminExisted(principal)){
            ModelAndView mav = new ModelAndView(new RedirectView("/logout"));
            return mav;
        }
        ModelAndView modelAndView = new ModelAndView(new RedirectView("/admin/comments"));
        cService.deleteComment(commentId);
        return modelAndView;
    }

}
