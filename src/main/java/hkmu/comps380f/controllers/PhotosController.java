package hkmu.comps380f.controllers;

import hkmu.comps380f.dao.CommentService;
import hkmu.comps380f.dao.PhotoService;
import hkmu.comps380f.dao.UserService;
import hkmu.comps380f.exception.AttachmentNotFound;
import hkmu.comps380f.exception.PhotoNotFound;
import hkmu.comps380f.models.Comment;
import hkmu.comps380f.models.Photo;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/photos")
public class PhotosController {

    @Resource
    private PhotoService pService;

    @Resource
    private CommentService cService;
    @Resource
    private UserService uService;
    @GetMapping("/upload")
    public ModelAndView upload(){
        Form photoForm = new Form();
        ModelAndView modelAndView = new ModelAndView("uploadphoto");
        modelAndView.addObject("photoForm", photoForm);
        return modelAndView;
    }
    @GetMapping("/delete/{photoId}")
    public ModelAndView delete(@PathVariable("photoId") long photoId,Principal principal, HttpServletRequest request) throws PhotoNotFound {
        Photo photo = pService.getPhoto(photoId);
        if (!request.isUserInRole("ROLE_ADMIN") && !principal.getName().equals(photo.getUsername())){
            return new ModelAndView(new RedirectView("/index", true));
        }
        pService.delete(photoId);
        ModelAndView modelAndView = new ModelAndView(new RedirectView("/photos/my"));
        modelAndView.getModel().put("delete", "success");
        return modelAndView;

    }
    public static class Form {
        private String description;

        private MultipartFile attachment;

        // Getters and Setters of customerName, subject, body, attachments

        public String getDescription(){
            return description;
        }
        public void setDescription(String description){
            this.description = description;
        }
        public MultipartFile getAttachment() {
            return attachment;
        }

        public void setAttachment(MultipartFile attachment) {
            this.attachment = attachment;
        }
    }
    @PostMapping("/upload")
    public View uploadPhoto(HttpServletRequest request, Principal principal, @ModelAttribute ("photoForm") Form form) throws IOException {
        long photoId = pService.createPhoto(principal.getName(),
                form.getDescription(), form.getAttachment());
        return new RedirectView("/photos/" + photoId, true);

    }
    @GetMapping("/{photoId}")
    public String view(@PathVariable("photoId") long photoId,
                       ModelMap model)
            throws  AttachmentNotFound, PhotoNotFound  {

        List<Comment> comments = cService.getComments(photoId);

        Photo photo = pService.getPhoto(photoId);
        if(photo.getAttachment() == null){
            throw new AttachmentNotFound();
        }
        String base64Img = Base64.getEncoder().encodeToString(photo.getAttachment().getContents());
        model.addAttribute("photoId", photoId);
        model.addAttribute("photo", photo);
        model.addAttribute("img", base64Img);
        model.addAttribute("comments", comments);

        return "photo";
    }

    @PostMapping("/{photoId}/comment/create")
    public View postComment(@PathVariable("photoId") long photoId,
                              ModelMap model, Principal principal, HttpServletRequest request) {
        String description = request.getParameter("comment");
        Date date = new Date();
        Timestamp ts=new Timestamp(date.getTime());
        String username = principal.getName();
        Comment comment = new Comment(username, ts, photoId, description);
        cService.saveComment(comment);

        return new RedirectView("/photos/" + photoId, true);
    }

    @PostMapping("/comment/delete/{commentId}")
    public View deleteComment(@PathVariable("commentId") long commentId,
                             Principal principal) {

        cService.deleteComment(commentId);

        return new RedirectView("/Dashboard/", true);
    }

    @GetMapping("/my")
    public ModelAndView my(HttpServletRequest request, Principal principal){
        String delete = request.getParameter("delete");
        ModelAndView modelAndView = new ModelAndView("myphoto");
        List<Photo> photoList = pService.getMyPhotos(principal.getName());
        List<Map<String, String>> map = new ArrayList<>();
        for(Photo p: photoList){
            if(p.getAttachment() != null) {
                Map<String, String> m = new HashMap<>();
                String base64Img = Base64.getEncoder().encodeToString(p.getAttachment().getContents());
                m.put("username", p.getUsername());
                m.put("id", String.valueOf(p.getId()));
                m.put("src", base64Img);

                map.add(m);
            }
        }
        modelAndView.addObject("delete", delete);
        modelAndView.addObject("photoList", map);
        return modelAndView;
    }


}
