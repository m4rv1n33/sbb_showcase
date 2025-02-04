package ch.strasser.marvin.sbb_showcase;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface vehicleRepository extends JpaRepository<vehicle, Long> {

    // Alle Fahrzeuge eines bestimmten Typs abrufen
    List<vehicle> findByVehicleType(String vehicleType);

    // Anzahl der Fahrzeuge eines bestimmten Typs zählen
    @Query("SELECT COUNT(v) FROM vehicle v WHERE v.vehicleType = :type")
    long countByVehicleType(@Param("type") String type);
}
