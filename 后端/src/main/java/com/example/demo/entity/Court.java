package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "court")
public class Court {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Sport sport;

    @Column(nullable = false)
    private Integer courtNumber;

    @Column(nullable = false)
    private String location;

    // getters and setters
}

enum Sport {
    羽毛球, 乒乓球, 网球, 台球
}
