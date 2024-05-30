<<<<<<< HEAD
package com.example.demo.controller;

import com.example.demo.entity.StudyRoom;
import com.example.demo.repository.StudyRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/studyrooms")
public class StudyRoomController {

    @Autowired
    private StudyRoomRepository studyRoomRepository;

    @GetMapping
    public List<StudyRoom> getAllStudyRooms() {
        return studyRoomRepository.findAll();
    }

    @GetMapping("/{id}")
    public StudyRoom getStudyRoomById(@PathVariable Integer id) {
        return studyRoomRepository.findById(id).orElse(null);
    }

    @PostMapping
    public StudyRoom createStudyRoom(@RequestBody StudyRoom studyRoom) {
        return studyRoomRepository.save(studyRoom);
    }

    @PutMapping("/{id}")
    public StudyRoom updateStudyRoom(@PathVariable Integer id, @RequestBody StudyRoom studyRoomDetails) {
        StudyRoom studyRoom = studyRoomRepository.findById(id).orElse(null);
        if (studyRoom != null) {
            studyRoom.setRoomName(studyRoomDetails.getRoomName());
            studyRoom.setLocation(studyRoomDetails.getLocation());
            studyRoom.setCapacity(studyRoomDetails.getCapacity());
            studyRoom.setStatus(studyRoomDetails.getStatus());
            studyRoom.setImagePath(studyRoomDetails.getImagePath());
            return studyRoomRepository.save(studyRoom);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteStudyRoom(@PathVariable Integer id) {
        studyRoomRepository.deleteById(id);
    }
=======
package com.example.demo.controller;public class StudyRoomController {
>>>>>>> d781de6a8631ee568913b11f007be21523bd2d8b
}
