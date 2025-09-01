package ch.strasser.marvin.sbb_showcase;
/*
Marvin Strasser
SBB Showcase
Version 1.0
01.09.2025
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

    @GetMapping("/")
    public String showVehicleTypes(
            @RequestParam(value = "search", required = false) String search,
            Model model) {

        // load all vehicles
        List<vehicle> allVehicles = vehicleRepository.findAll(Sort.by("vehicleType"));

        if (search != null && !search.isEmpty()) {
            allVehicles = allVehicles.stream()
                    .filter(v -> v.getVehicleType().toLowerCase().contains(search.toLowerCase()))
                    .collect(Collectors.toList());
        }

        // filter categories
        List<String> lokomotiven = allVehicles.stream()
                .filter(v -> "Lokomotive".equals(v.getType()))
                .map(vehicle::getVehicleType)
                .distinct()
                .collect(Collectors.toList());

        List<String> triebzuege = allVehicles.stream()
                .filter(v -> "Triebzug".equals(v.getType()))
                .map(vehicle::getVehicleType)
                .distinct()
                .collect(Collectors.toList());

        List<String> wagen = allVehicles.stream()
                .filter(v -> "Wagen".equals(v.getType()))
                .map(vehicle::getVehicleType)
                .distinct()
                .collect(Collectors.toList());

        model.addAttribute("lokomotiven", lokomotiven);
        model.addAttribute("triebzuege", triebzuege);
        model.addAttribute("wagen", wagen);
        model.addAttribute("search", search);

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
