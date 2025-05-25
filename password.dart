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


Widget genreButton(String label, String imagePath, VoidCallback onTap) {
  return SizedBox(
    width: 180,
    height: 100,
    child: ElevatedButton(
      onPressed: onTap,
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
  int likes;
  final String price;

  Song({
    required this.title,
    required this.artist,
    required this.assetPath,
    required this.coverPath,
    this.likes = 0,
    required this.price,
  });
}



List<Song> localSongs = [
  Song(title: 'WTF', artist: "Hugel Delsa" , assetPath: 'wtf_hugel.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 8 , price: "free"),
  Song(title: 'FE!N', artist: 'Travis Scott' ,  assetPath: 'FE!N_Travis Scott, Playboi Carti.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 10 , price: "free"),
  Song(title: 'Star Boy', artist: 'The Weekend' , assetPath: 'starboy.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 5 , price: "free"),
];


List<Song> mySongs = [
  Song(title: 'Love Again', artist: 'Dua Lipa', assetPath: 'Love Again_Dua Lipa.mp3', coverPath: 'assets/Picsart_25-05-22_22-58-26-524.jpg', likes: 6 , price: "free"),
  Song(title: 'The Scotts', artist: 'Travis Scott & Kid Cudi', assetPath: 'the_scotts_kid.mp3', coverPath: 'assets/Picsart_25-05-22_22-58-26-524.jpg', price: "free" , likes: 7),
];


List<Song> AllMYSongs = [
  Song(title: 'WTF', artist: "Hugel Delsa" , assetPath: 'wtf_hugel.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 8 , price: "free"),
  Song(title: 'FE!N', artist: 'Travis Scott' ,  assetPath: 'FE!N_Travis Scott, Playboi Carti.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 10 , price: "free"),
  Song(title: 'Star Boy', artist: 'The Weekend' , assetPath: 'starboy.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 5 , price: "free"),
  Song(title: 'Love Again', artist: 'Dua Lipa', assetPath: 'Love Again_Dua Lipa.mp3', coverPath: 'assets/Picsart_25-05-22_22-58-26-524.jpg', likes: 6 , price: "free"),
  Song(title: 'The Scotts', artist: 'Travis Scott & Kid Cudi', assetPath: 'the_scotts_kid.mp3', coverPath: 'assets/Picsart_25-05-22_22-58-26-524.jpg', price: "free" , likes: 7),
];


List<Song> RockSongs = [
  Song(title: 'Going Under', artist: 'Evanescence', assetPath: '11_Going_Under_Evanescence.mp3', coverPath: 'assets/Picsart_25-05-22_22-59-22-696.jpg' , likes: 2 , price: "2.50"),
  Song(title: 'Black Betty', artist: 'Ram Jam', assetPath: 'Black Betty_Ram Jam.mp3', coverPath: 'assets/Picsart_25-05-22_22-59-22-696.jpg' , likes: 3, price: "3.99")
];


List<Song> HipHopSongs = [
  Song(title: 'Flashing Lights', artist: 'Drake', assetPath: 'Flashing_Lights_(feat. Dwele)_Kanye West.mp3', coverPath: 'assets/Picsart_25-05-22_23-01-19-759.jpg', price: '3.49' , likes: 4),
  Song(title: "Big Dawgs", artist: 'Hanu Mankind', assetPath: 'HanuMankind_Ft_Kalmi_Big_Dawgs_musicdel.ir.mp3', coverPath: 'assets/Picsart_25-05-22_23-01-19-759.jpg', price: '2.99' , likes: 2),
];


List<Song> PopSongs = [
  Song(title: 'Dreamers', artist: 'Savoir Adore', assetPath: '16_Dreamers_Savoir_Adore.mp3', coverPath: 'assets/Picsart_25-05-22_22-59-54-606.jpg', price: '4.30' , likes: 3),
  Song(title: 'Die Young', artist: 'Kesha', assetPath: 'Die Young_Kesha.mp3', coverPath: 'assets/Picsart_25-05-22_22-59-54-606.jpg', price: '1.99' , likes: 5),
  Song(title: 'Break My Heart', artist: 'Dua lipa', assetPath: 'Dua_Lipa_Break_My_Heart_dibamusics.mp3', coverPath: 'assets/Picsart_25-05-22_22-59-54-606.jpg', price: '6.00' , likes: 3),
];


List<Song> PersianSongs = [
  Song(title: 'Mano Yadet Nemiad', artist: 'Kasra Zahedi', assetPath: 'Kasra Zahedi_Mano Yadet Nemiad (128).mp3', coverPath: 'assets/Picsart_25-05-22_23-02-07-475.jpg', price: "7.39" , likes: 5),
];


List<Song> ClassicSongs = [
  Song(title: 'Dreamers', artist: 'Savoir Adore', assetPath: '16_Dreamers_Savoir_Adore.mp3', coverPath: 'assets/Picsart_25-05-22_23-02-47-206.jpg', price: '4.30' , likes: 3),
  Song(title: 'Die Young', artist: 'Kesha', assetPath: 'Die Young_Kesha.mp3', coverPath: 'assets/Picsart_25-05-22_23-02-47-206.jpg', price: '1.99' , likes: 5),
  Song(title: 'Break My Heart', artist: 'Dua lipa', assetPath: 'Dua_Lipa_Break_My_Heart_dibamusics.mp3', coverPath: 'assets/Picsart_25-05-22_23-02-47-206.jpg', price: '6.00' , likes: 3),
];


List<Song> AllHipHop = [
  Song(title: 'FE!N', artist: 'Travis Scott' ,  assetPath: 'FE!N_Travis Scott, Playboi Carti.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 10 , price: "free"),
  Song(title: 'The Scotts', artist: 'Travis Scott & Kid Cudi', assetPath: 'the_scotts_kid.mp3', coverPath: 'assets/Picsart_25-05-22_22-58-26-524.jpg', price: "free" , likes: 7),
  Song(title: 'Flashing Lights', artist: 'Drake', assetPath: 'Flashing_Lights_(feat. Dwele)_Kanye West.mp3', coverPath: 'assets/Picsart_25-05-22_23-01-19-759.jpg', price: '3.49' , likes: 4),
  Song(title: "Big Dawgs", artist: 'Hanu Mankind', assetPath: 'HanuMankind_Ft_Kalmi_Big_Dawgs_musicdel.ir.mp3', coverPath: 'assets/Picsart_25-05-22_23-01-19-759.jpg', price: '2.99' , likes: 2),
];


List<Song> AllPop = [
  Song(title: 'Dreamers', artist: 'Savoir Adore', assetPath: '16_Dreamers_Savoir_Adore.mp3', coverPath: 'assets/Picsart_25-05-22_22-59-54-606.jpg', price: '4.30' , likes: 3),
  Song(title: 'Die Young', artist: 'Kesha', assetPath: 'Die Young_Kesha.mp3', coverPath: 'assets/Picsart_25-05-22_22-59-54-606.jpg', price: '1.99' , likes: 5),
  Song(title: 'Break My Heart', artist: 'Dua lipa', assetPath: 'Dua_Lipa_Break_My_Heart_dibamusics.mp3', coverPath: 'assets/Picsart_25-05-22_22-59-54-606.jpg', price: '6.00' , likes: 3),
  Song(title: 'WTF', artist: "Hugel Delsa" , assetPath: 'wtf_hugel.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 8 , price: "free"),
  Song(title: 'Star Boy', artist: 'The Weekend' , assetPath: 'starboy.mp3' , coverPath: 'assets/Picsart_25-05-22_23-00-43-699.jpg' , likes: 5 , price: "free"),
  Song(title: 'Love Again', artist: 'Dua Lipa', assetPath: 'Love Again_Dua Lipa.mp3', coverPath: 'assets/Picsart_25-05-22_22-58-26-524.jpg', likes: 6 , price: "free"),
];


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
}




