package hkmu.comps380f.repositories;

import hkmu.comps380f.models.Photo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PhotoRepository extends JpaRepository<Photo, Long> {

    @Query(value = "SELECT p FROM Photo p where p.username = ?1")
    List<Photo> findAllbyUsername(String username);

}
