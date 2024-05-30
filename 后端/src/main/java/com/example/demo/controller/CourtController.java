<<<<<<< HEAD
package com.example.demo.controller;

import com.example.demo.entity.Court;
import com.example.demo.repository.CourtRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/courts")
public class CourtController {

    @Autowired
    private CourtRepository courtRepository;

    @GetMapping
    public List<Court> getAllCourts() {
        return courtRepository.findAll();
    }

    @GetMapping("/{id}")
    public Court getCourtById(@PathVariable Integer id) {
        return courtRepository.findById(id).orElse(null);
    }

    @PostMapping
    public Court createCourt(@RequestBody Court court) {
        return courtRepository.save(court);
    }

    @PutMapping("/{id}")
    public Court updateCourt(@PathVariable Integer id, @RequestBody Court courtDetails) {
        Court court = courtRepository.findById(id).orElse(null);
        if (court != null) {
            court.setSport(courtDetails.getSport());
            court.setCourtNumber(courtDetails.getCourtNumber());
            court.setLocation(courtDetails.getLocation());
            return courtRepository.save(court);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteCourt(@PathVariable Integer id) {
        courtRepository.deleteById(id);
    }
=======
package com.example.demo.controller;public class CourtController {
>>>>>>> d781de6a8631ee568913b11f007be21523bd2d8b
}
