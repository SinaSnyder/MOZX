package com.example.testfive.dto;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class CommentResponse {
    private Long id;
    private String authorName; // یا userId
    private String text;
    private String createdAt;
    private int likes;
    private int dislikes;
}