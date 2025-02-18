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

    // Shows main page with vehicle types
    @GetMapping("/")
    public String showVehicleTypes(Model model) {
        List<String> vehicleTypes = vehicleRepository.findAll().stream()
                .map(vehicle::getVehicleType)
                .distinct()
                .collect(Collectors.toList());
        model.addAttribute("vehicleTypes", vehicleTypes);
        return "index";
    }

    // shows details of a vehicle type
    @GetMapping("/details")
    public String showVehicleDetails(@RequestParam("type") String type, Model model) {
        List<vehicle> vehicles = vehicleRepository.findByVehicleType(type);

        if (vehicles.isEmpty()) {
            return "redirect:/";
        }

        vehicle vehicle = vehicles.get(0);
        model.addAttribute("vehicleType", vehicle.getVehicleType());
        model.addAttribute("imageUrl", vehicle.getImageUrl());
        model.addAttribute("passengerSeats", vehicle.getPassengerSeats());
        model.addAttribute("maxAllowedSpeed", vehicle.getMaxAllowedSpeed());
        model.addAttribute("lengthOverBuffer", vehicle.getLengthOverBuffer());
        model.addAttribute("type", vehicle.getType());
        model.addAttribute("count", vehicleRepository.countByVehicleType(type));

        return "details";
    }

}
