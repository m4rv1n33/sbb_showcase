package ch.strasser.marvin.sbb_showcase;
/*
Marvin Strasser
SBB Showcase
Version 1.0
25.03.2025
*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Sort;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class vehicleController {

    private final vehicleRepository vehicleRepository;

    public vehicleController(vehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    // Shows main page with vehicle types, sorted in a way that displays vehicles in order of:
    // 1. Electrical Locomotives (Locomotives are considered train sets such as DPZ or HVZ and not listed as standalone engines)
    // 2. Electrical Multiple Units
    // 3. Passenger Carriages
    @GetMapping("/")
    public String showVehicleTypes(Model model) {
        // Find vehicles that start with R
        List<String> vehicleTypes = vehicleRepository.findAll(Sort.by(Sort.Order.desc("vehicleType")))
                .stream()
                .map(vehicle::getVehicleType)
                .distinct()
                .collect(Collectors.toList());

        model.addAttribute("vehicleTypes", vehicleTypes);
        return "index";
    }

    // Shows details of a vehicle type
    @GetMapping("/details")
    public String showVehicleDetails(@RequestParam("type") String type, Model model) {
        // Get vehicles with a specific type
        List<vehicle> vehicles = vehicleRepository.findByVehicleType(type, Sort.by(Sort.Order.asc("vehicleType")));

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
