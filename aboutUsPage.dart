import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:MOZX/mozx/LogInPage.dart';
import 'package:MOZX/mozx/password.dart';
import 'package:MOZX/mozx/SignUpPage.dart';
import 'package:MOZX/mozx/ShopPage.dart';
import 'package:MOZX/mozx/MySongPage.dart';
import 'package:MOZX/mozx/MOZX.dart';
import 'package:MOZX/mozx/Profile.dart';
import 'package:MOZX/mozx/NowPlayingPage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:MOZX/mozx/PurchasePage.dart';
import 'package:MOZX/mozx/ListOfSongs.dart';
import 'package:MOZX/mozx/SearchPage.dart';
import 'package:MOZX/mozx/song.dart';
import 'package:MOZX/mozx/aboutUsPage.dart';


class WritePage extends StatefulWidget {
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("About us"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "سلام ما ایلیا و سینا و فاطمه هستیم و این برنامه رو ساختیم اگه نظری برای بهتر شدنش داری به این ایدی ها تو تلگرام پیام بده@Sinaxrh1384 @Iliaamm",
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blueAccent),
            ),
          ),
        ),
      ),
    );
  }
}