package hkmu.comps380f.dao;

import hkmu.comps380f.exception.PhotoNotFound;
import hkmu.comps380f.models.Comment;
import hkmu.comps380f.repositories.CommentRepository;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentService {


    @Resource
    private CommentRepository cRepo;
    @Transactional
    public void saveComment(Comment c){
        cRepo.save(c);
    }

    @Transactional
    public void deleteComment(long commentId){
        cRepo.deleteById(commentId);
    }

    @Transactional(rollbackFor = PhotoNotFound.class)
    public void delete(String username){
        List<Comment> deletedComments = cRepo.findAllByUsernameDesc(username);
        for(Comment c: deletedComments){
            cRepo.delete(c);
        }

    }

    @Transactional
    public List<Comment> getComments(Long photoId){
        List<Comment> comments = cRepo.findAllbyPhotoIdDesc(photoId);
        return comments;
    }

}
