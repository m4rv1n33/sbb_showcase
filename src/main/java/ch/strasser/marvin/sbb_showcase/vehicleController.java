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
        List<vehicle> vehicles = vehicleRepository.findAll().stream()
                .filter(vehicle -> vehicle.getVehicleType().equalsIgnoreCase(type))
                .collect(Collectors.toList());
        model.addAttribute("vehicles", vehicles);
        model.addAttribute("type", type);
        return "details";
    }
}
