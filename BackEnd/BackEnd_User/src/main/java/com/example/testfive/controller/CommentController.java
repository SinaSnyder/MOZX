package com.example.testfive.controller;

import com.example.testfive.entity.Comment;
import com.example.testfive.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/comments")
@CrossOrigin(origins = "*")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping
    public ResponseEntity<Comment> addComment(@RequestBody Comment comment) {
        return ResponseEntity.ok(commentService.saveComment(comment));
    }

    @GetMapping("/{songId}")
    public ResponseEntity<List<Comment>> getComments(@PathVariable String songId) {
        return ResponseEntity.ok(commentService.getCommentsBySong(songId));
    }
}
