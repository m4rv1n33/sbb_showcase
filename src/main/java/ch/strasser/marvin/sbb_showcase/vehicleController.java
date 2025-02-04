package ch.strasser.marvin.sbb_showcase;/*
Marvin Strasser
Project_Name
Version 1.0
DATE
*/

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class vehicleController {

    private final vehicleRepository vehicleRepository;

    public vehicleController(vehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    // Zeigt die Hauptseite mit der Fahrzeugtabelle
    @GetMapping("/")
    public String showVehicleTypes(Model model) {
        List<String> vehicleTypes = vehicleRepository.findAll().stream()
                .map(vehicle::getVehicleType)
                .distinct()
                .collect(Collectors.toList());
        model.addAttribute("vehicleTypes", vehicleTypes);
        return "index";
    }

    // Zeigt die Detailseite mit Fahrzeugen eines Typs
    @GetMapping("/details")
    public String showVehicleDetails(@RequestParam("type") String type, Model model) {
        List<vehicle> vehicles = vehicleRepository.findByVehicleType(type);

        if (vehicles.isEmpty()) {
            return "redirect:/";
        }

        String imageUrl = vehicles.get(0).getImageUrl();
        int passengerSeats = vehicles.get(0).getPassengerSeats();
        int maxAllowedSpeed = vehicles.get(0).getMaxAllowedSpeed();
        long count = vehicleRepository.countByVehicleType(type);

        // Werte an die HTML-Seite übergeben
        model.addAttribute("type", type);
        model.addAttribute("imageUrl", imageUrl);
        model.addAttribute("passengerSeats", passengerSeats);
        model.addAttribute("maxAllowedSpeed", maxAllowedSpeed);
        model.addAttribute("count", count);

        return "details";
    }

}
