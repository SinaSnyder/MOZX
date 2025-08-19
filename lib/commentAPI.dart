import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';
import 'PurchasePage.dart';

Future<void> addComment(String songId, String text, int userId) async {
  final url = Uri.parse("$baseUrl/api/shop/$songId/comments");
  final res = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
      "X-User-Id": userId.toString(),
    },
    body: jsonEncode({"text": text}),
  );
  print("Response: ${res.body}");
}

Future<List<Comment>> getComments(String songId) async {
  final url = Uri.parse("$baseUrl/api/shop/$songId/comments");
  final res = await http.get(url);

  if (res.statusCode == 200) {
    final List<dynamic> data = jsonDecode(res.body);
    return data.map((c) => Comment(
      author: c['author'],
      text: c['text'],
      likes: c['likes'],
      dislikes: c['dislikes'],
    )).toList();
  } else {
    throw Exception("Error");
  }
}
