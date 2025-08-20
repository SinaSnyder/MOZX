package com.example.testfive.controller;

import com.example.testfive.entity.*;
import com.example.testfive.model.User;
import com.example.testfive.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.testfive.repository.*;
import com.example.testfive.dto.*;
import lombok.*;
import java.util.List;

@RestController
@RequestMapping("/api/comments")
@CrossOrigin(origins = "*")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserRepository personRepository;

    @PostMapping
    public ResponseEntity<Comment> addComment(@RequestBody CommentRequest request) {
        User user = personRepository.findById(request.getUserId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        Comment comment = new Comment();
        comment.setSongId(request.getSongId());
        comment.setText(request.getText());
        comment.setUser(user);

        return ResponseEntity.ok(commentService.saveComment(comment));
    }


    @GetMapping("/{songId}")
    public ResponseEntity<List<Comment>> getComments(@PathVariable String songId) {
        return ResponseEntity.ok(commentService.getCommentsBySong(songId));
    }
}

