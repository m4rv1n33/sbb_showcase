package ch.strasser.marvin.sbb_showcase;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface vehicleRepository extends JpaRepository<vehicle, Long> {

    // callback function to find all vehicles of a certain type, sorted by vehicleType
    List<vehicle> findByVehicleType(String vehicleType, Sort sort);

    // number of vehicles of a certain type
    @Query("SELECT COUNT(v) FROM vehicle v WHERE v.vehicleType = :type")
    long countByVehicleType(@Param("type") String type);

    String VehicleType(String vehicleType);
}
