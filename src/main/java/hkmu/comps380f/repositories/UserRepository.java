package hkmu.comps380f.repositories;

import hkmu.comps380f.models.PhotoUser;
import org.springframework.data.jpa.repository.JpaRepository;
public interface UserRepository extends JpaRepository<PhotoUser, String> {

}
