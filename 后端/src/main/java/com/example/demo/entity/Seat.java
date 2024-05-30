<<<<<<< HEAD
package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "Seats")
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer seatId;

    @ManyToOne
    @JoinColumn(name = "roomId")
    private StudyRoom studyRoom;

    @Column(nullable = false)
    private Integer seatNumber;

    // getters and setters
=======
package com.example.demo.entity;public class Seat {
>>>>>>> d781de6a8631ee568913b11f007be21523bd2d8b
}
