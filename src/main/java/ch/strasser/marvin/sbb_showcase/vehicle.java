package ch.strasser.marvin.sbb_showcase;
/*
Marvin Strasser
SBB Showcase
Version 1.0
22.09.2025
*/
import jakarta.persistence.*;

@Entity
@Table(name = "vehicles")
public class vehicle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "vehicle_type", nullable = false)
    private String vehicleType;

    @Column(name = "vehicle_number")
    private String vehicleNumber;

    @Column(name = "passenger_seats")
    private int passengerSeats;

    @Column(name = "max_allowed_speed")
    private int maxAllowedSpeed;

    @Column(name = "type")
    private String type;

    @Column(name = "length_over_buffer")
    private Double lengthOverBuffer;

    @Column(name = "image_url")
    private String imageUrl;

    public vehicle() {}

    public vehicle(String vehicleType, String vehicleNumber, int passengerSeats, int maxAllowedSpeed, String type, Double lengthOverBuffer, String imageUrl) {
        this.vehicleType = vehicleType;
        this.vehicleNumber = vehicleNumber;
        this.passengerSeats = passengerSeats;
        this.maxAllowedSpeed = maxAllowedSpeed;
        this.type = type;
        this.lengthOverBuffer = lengthOverBuffer;
        this.imageUrl = imageUrl;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public int getPassengerSeats() {
        return passengerSeats;
    }

    public void setPassengerSeats(int passengerSeats) {
        this.passengerSeats = passengerSeats;
    }

    public int getMaxAllowedSpeed() {
        return maxAllowedSpeed;
    }

    public void setMaxAllowedSpeed(int maxAllowedSpeed) {
        this.maxAllowedSpeed = maxAllowedSpeed;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getLengthOverBuffer() {
        return lengthOverBuffer;
    }

    public void setLengthOverBuffer(Double lengthOverBuffer) {
        this.lengthOverBuffer = lengthOverBuffer;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Vehicle{" +
                "id=" + id +
                ", vehicleType='" + vehicleType + '\'' +
                ", vehicleNumber='" + vehicleNumber + '\'' +
                ", passengerSeats=" + passengerSeats +
                ", maxAllowedSpeed=" + maxAllowedSpeed +
                ", type='" + type + '\'' +
                ", lengthOverBuffer=" + lengthOverBuffer +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}
