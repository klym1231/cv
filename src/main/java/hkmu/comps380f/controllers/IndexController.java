package hkmu.comps380f.controllers;

import hkmu.comps380f.dao.PhotoService;
import hkmu.comps380f.dao.UserService;
import hkmu.comps380f.models.Photo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.util.*;

@Controller
public class IndexController {

    @Resource
    private PhotoService pService;

    @Resource
    private UserService uService;

    @GetMapping ("/")
    public ModelAndView defaultIndex(Model model) {
        List<String> base64ImgList = new ArrayList<>();
        List<Map<String, String>> map = new ArrayList<>();
        for(Photo p: pService.getPhotos()){
            if(p.getAttachment() != null) {
                Map<String, String> m = new HashMap<>();
                String base64Img = Base64.getEncoder().encodeToString(p.getAttachment().getContents());
                m.put("username", p.getUsername());
                m.put("id", String.valueOf(p.getId()));
                m.put("src", base64Img);

                base64ImgList.add(base64Img);
                map.add(m);
            }
        }
        model.addAttribute("photoList", base64ImgList);
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("photo", map);
        return modelAndView;
    }

    @GetMapping("/index")
    public View index(){
        return new RedirectView("/");
    }
}
