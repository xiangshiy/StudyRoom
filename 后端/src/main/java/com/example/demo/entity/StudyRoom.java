<<<<<<< HEAD
package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "StudyRooms")
public class StudyRoom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer roomId;

    @Column(nullable = false)
    private String roomName;

    private String location;

    @Column(nullable = false)
    private Integer capacity;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status;

    private String imagePath;

    // getters and setters
}

enum Status {
    available, reserved, closed
=======
package com.example.demo.entity;public class StudyRoom {
>>>>>>> d781de6a8631ee568913b11f007be21523bd2d8b
}
