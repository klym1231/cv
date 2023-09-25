package hkmu.comps380f.repositories;

import hkmu.comps380f.models.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    @Query(value = "SELECT c FROM Comment c where c.photoId = ?1 order by c.date DESC")
    List<Comment> findAllbyPhotoIdDesc(Long photoId);

    @Query(value = "SELECT c FROM Comment c where c.username = ?1 order by c.date DESC")
    List<Comment> findAllByUsernameDesc(String username);

}
