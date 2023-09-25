package hkmu.comps380f.controllers;

import hkmu.comps380f.dao.PhotoService;
import hkmu.comps380f.models.Photo;
import hkmu.comps380f.models.PhotoUser;
import hkmu.comps380f.repositories.UserRepository;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping("/profile")
public class UserProfileController {

        @Resource
        private UserRepository uRepo;

        @Resource
        private PhotoService pService;
    @GetMapping ("/my")
    public ModelAndView myProfile(Principal principal, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("profile");
        PhotoUser user = uRepo.findById(principal.getName()).orElse(null);
        modelAndView.addObject("User", user);
        modelAndView.addObject("Success", request.getParameter("success"));
        return modelAndView;
    }
    @PostMapping("/my")
    public View myProfile(HttpServletRequest request, Principal principal){
        PhotoUser user = uRepo.findById(principal.getName()).orElse(null);
        String description = request.getParameter("description");
        user.setDescription(description);
        uRepo.save(user);

        return new RedirectView("/profile/my?success=true", true);
    }
    @GetMapping("/user/{username}")
    public ModelAndView userProfile(@PathVariable("username") String username, HttpServletRequest request, Model model) {

        ModelAndView modelAndView = new ModelAndView("userprofile");
        PhotoUser user = uRepo.findById(username).orElse(null);
        List<Photo> photoList = pService.getMyPhotos(username);
        List<Map<String, String>> map = new ArrayList<>();
        for(Photo p: photoList){
            if(p.getAttachment() != null) {
                Map<String, String> m = new HashMap<>();
                String base64Img = Base64.getEncoder().encodeToString(p.getAttachment().getContents());
                m.put("id", String.valueOf(p.getId()));
                m.put("src", base64Img);

                map.add(m);
            }
        }
        modelAndView.addObject("photoList", map);
        modelAndView.addObject("User", user);
        return modelAndView;
    }

}
