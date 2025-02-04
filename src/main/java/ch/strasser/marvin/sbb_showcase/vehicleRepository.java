package ch.strasser.marvin.sbb_showcase;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface vehicleRepository extends JpaRepository<vehicle, Long> {
    List<vehicle> findByType(String type);
}
