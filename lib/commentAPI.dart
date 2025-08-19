import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';

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
