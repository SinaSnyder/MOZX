package com.example.testfive.dto;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder @Data
public class CommentRequest {
    private String songId;
    private String text;
}

