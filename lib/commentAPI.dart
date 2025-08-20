import 'dart:convert';
import 'package:MOZX/config.dart';
import 'package:http/http.dart' as http;

class Comment {
  final String author;
  final String text;
  int likes;
  int dislikes;

  Comment({
    required this.author,
    required this.text,
    this.likes = 0,
    this.dislikes = 0,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      author: json['userId'].toString(),
      text: json['text'],
      likes: json['likes'],
      dislikes: json['dislikes'],
    );
  }
}

Future<void> addComment(String songId, String text, int userId) async {
  final url = Uri.parse("$baseUrl/api/comments");
  print("Sending comment to: $url");
  print("Payload: {songId: $songId, userId: $userId, text: $text}");

  try {
    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "songId": songId,
        "username": userId,
        "text": text,
      }),
    );

    print("Response status: ${res.statusCode}");
    print("Response body: ${res.body}");

    if (res.statusCode != 200) {
      throw Exception("HTTP Error: ${res.statusCode}, Body: ${res.body}");
    }
  } catch (e) {
    print("Full error: $e");
    rethrow;
  }
}

Future<List<Comment>> getComments(String songId) async {
  final url = Uri.parse("$baseUrl/api/comments/$songId");
  final res = await http.get(url);

  if (res.statusCode == 200) {
    final List<dynamic> data = jsonDecode(res.body);
    return data.map((c) => Comment.fromJson(c)).toList();
  } else {
    throw Exception("Error2");
  }
}
