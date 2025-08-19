package com.example.testfive.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity @Table(name = "comment")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Comment {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="song_id", length=255)
    private String songId;

    @Column(name="user_id")
    private Long userId;

    @Column(length = 1000)
    private String text;

    private LocalDateTime createdAt = LocalDateTime.now();
    private int likes = 0;
    private int dislikes = 0;
}
