package com.example.testfive.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import com.example.testfive.dto.*;

@Entity
@Table(name = "comments")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String songId;

    private String text;

    private int likes = 0;

    private int dislikes = 0;

    @ManyToOne
    @JoinColumn(name = "user_name", referencedColumnName = "name")
    private Person user;
}
