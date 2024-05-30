<<<<<<< HEAD
package com.example.demo.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "User")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;

    @Column(nullable = false)
    private String userName;

    @Column(nullable = false)
    private String userKey;

    private String school;

    @Enumerated(EnumType.STRING)
    private Sex sex;

    @Temporal(TemporalType.DATE)
    private Date birthday;

    private String telephone;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role;

    // getters and setters
}

enum Sex {
    male, female
}

enum Role {
    student, admin
=======
package com.example.demo;

public class User {
>>>>>>> d781de6a8631ee568913b11f007be21523bd2d8b
}
