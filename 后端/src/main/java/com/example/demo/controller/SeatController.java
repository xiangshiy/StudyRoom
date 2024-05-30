<<<<<<< HEAD
package com.example.demo.controller;

import com.example.demo.entity.Seat;
import com.example.demo.repository.SeatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/seats")
public class SeatController {

    @Autowired
    private SeatRepository seatRepository;

    @GetMapping
    public List<Seat> getAllSeats() {
        return seatRepository.findAll();
    }

    @GetMapping("/{id}")
    public Seat getSeatById(@PathVariable Integer id) {
        return seatRepository.findById(id).orElse(null);
    }

    @PostMapping
    public Seat createSeat(@RequestBody Seat seat) {
        return seatRepository.save(seat);
    }

    @PutMapping("/{id}")
    public Seat updateSeat(@PathVariable Integer id, @RequestBody Seat seatDetails) {
        Seat seat = seatRepository.findById(id).orElse(null);
        if (seat != null) {
            seat.setSeatNumber(seatDetails.getSeatNumber());
            seat.setStudyRoom(seatDetails.getStudyRoom());
            return seatRepository.save(seat);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteSeat(@PathVariable Integer id) {
        seatRepository.deleteById(id);
    }
=======
package com.example.demo.controller;public class SeatController {
>>>>>>> d781de6a8631ee568913b11f007be21523bd2d8b
}
