package hkmu.comps380f.controllers;

import hkmu.comps380f.repositories.UserRepository;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignInController {
    @Resource
    private UserRepository uRepo;

    @GetMapping ("/signin")
    public ModelAndView login(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("signin");
        modelAndView.addObject("success", request.getParameter("success"));

        return modelAndView;
    }

//    @PostMapping("/signin")
//    public String loginHandler(HttpServletRequest request, HttpServletResponse response, Model model) throws NoSuchAlgorithmException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        Boolean error = false;
//        if(username.isEmpty()){
//            error = true;
//            model.addAttribute("username_empty_error", true);
//        }
//        if(password.isEmpty()){
//            error = true;
//            model.addAttribute("password_empty_error", true);
//        }
//        if(error == true) return "signin";
//        System.out.print("tesst");
//        /// checking if exist username first
//        PhotoUser user = uRepo.findById(username).orElse(null);
//        if(Objects.isNull(user)){
//            model.addAttribute("user_not_exist_error", true);
//            return "signin";
//        }
//
//        /// checking if password from db === encrypted password from submission
//        if(!user.getPassword().equals(password)){
//            model.addAttribute("password_mismatch_error", true);
//            return "signin";
//        }
//
//        Cookie jwtTokenCookie = new Cookie("username", username);
//        jwtTokenCookie.setMaxAge(86400);
//
//        /// login successfully
//        response.addCookie(jwtTokenCookie);
//
//        return "signin";
//
//    }

}
