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


class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({Key? key , required this.controller}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        prefixIcon: Icon(Icons.lock),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}




class ConfirmPassword extends StatefulWidget {
  final TextEditingController controller;
  const ConfirmPassword({Key? key , required this.controller }) : super(key: key);

  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        prefixIcon: Icon(Icons.lock),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}


Widget genreButton(String label, String imagePath) {
  return SizedBox(
    width: 180,
    height: 100,
    child: ElevatedButton(
      onPressed: () {
        // Filter or navigate
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.redHatDisplay().fontFamily,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}



class Song {
  final String title;
  final String artist;
  final String assetPath;
  final String coverPath;

  Song({
    required this.title,
    required this.artist,
    required this.assetPath,
    required this.coverPath,
  });
}



List<Song> localSongs = [
  Song(title: 'WTF', artist: "Hugel Delsa" , assetPath: 'wtf_hugel.mp3' , coverPath: 'assets/windows-11-stock-official-colorful-3840x2160-5666.jpg'),
  Song(title: 'FE!N', artist: 'Travis Scott' ,  assetPath: 'FE!N_Travis Scott, Playboi Carti.mp3' , coverPath: 'assets/windows-11-stock-official-colorful-3840x2160-5666.jpg'),
  Song(title: 'Star Boy', artist: 'The Weekend' , assetPath: 'starboy.mp3' , coverPath: 'assets/windows-11-stock-official-colorful-3840x2160-5666.jpg'),
];


List<Song> mySongs = [
  Song(title: 'Love Again', artist: 'Dua Lipa', assetPath: 'Love Again_Dua Lipa.mp3', coverPath: 'assets/windows-11-stock-official-colorful-3840x2160-5666.jpg',),
  Song(title: 'The Scotts', artist: 'Travis Scott & Kid Cudi', assetPath: 'the_scotts_kid.mp3', coverPath: 'assets/windows-11-stock-official-colorful-3840x2160-5666.jpg',),
];


