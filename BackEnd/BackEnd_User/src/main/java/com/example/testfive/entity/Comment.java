package com.example.testfive.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity @Table(name = "comment")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String songId;

    private Long userId;

    private String text;

    private int likes = 0;

    private int dislikes = 0;

    private LocalDateTime createdAt = LocalDateTime.now();
}
