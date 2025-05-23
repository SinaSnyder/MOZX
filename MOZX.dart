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


final player = AudioPlayer();

void main () {
  runApp(mozxApp());
}

class mozxApp extends StatelessWidget {
  const mozxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOZX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainMenuPage(),
    );
  }
}


class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
          foregroundColor: Color.fromARGB(255, 20, 20, 20),
          elevation: 0,
          title: Text(
            'MOZX',
            style: GoogleFonts.redHatDisplay(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 20),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.grey[900],
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/windows-11-stock-official-colorful-3840x2160-5666.jpg'),
                        fit: BoxFit.cover
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.perm_identity , size: 40, color: Colors.white,),
                      ),
                      SizedBox(height: 10,),
                      Text("NAME" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_outline_rounded , color : Colors.white),
                  title: Text('My Profile' , style: GoogleFonts.redHatDisplay(color: Colors.white),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.music_note_outlined , color : Colors.white),
                  title: Text('My Songs' , style: GoogleFonts.redHatDisplay(color: Colors.white),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MySongPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag_outlined , color : Colors.white),
                  title: Text('Shop' , style: GoogleFonts.redHatDisplay(color: Colors.white),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShopPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined , color : Colors.white),
                  title: Text('Setting' , style: GoogleFonts.redHatDisplay(color: Colors.white),),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Field
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white70),
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SongSearchPage()),
                    );
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => MySongPage()));
                          },
                          icon: Icon(Icons.music_note , color: Colors.white,),
                          label: Text("MY SONGS" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
                          style: OutlinedButton.styleFrom( backgroundColor: Colors.grey[800],),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 70,
                      height: 45,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.home , color: Colors.white,),
                        style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white), backgroundColor: Color.fromARGB(255, 20, 20, 20), foregroundColor: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => ShopPage()));
                          },
                          icon: Icon(Icons.shopping_bag , color: Colors.white,),
                          label: Text("SHOP" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
                          style: OutlinedButton.styleFrom( backgroundColor: Colors.grey[800],),

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text('LOCAL', style: GoogleFonts.redHatDisplay(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: localSongs.length,
                    itemBuilder: (context, index) {
                      final song = localSongs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NowPlayingPage(song: song),
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(song.coverPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),
                Text('MY SONGS', style: GoogleFonts.redHatDisplay(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mySongs.length,
                    itemBuilder: (context, index) {
                      final song = mySongs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NowPlayingPage(song: song),
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(song.coverPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                // Genre Buttons (2 per row)
                Text('GENRES', style: GoogleFonts.redHatDisplay(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 10 ,),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SizedBox(width: 1,),
                    genreButton('POP', 'assets/blue-gradient-4000x4000-19871.png'),
                    genreButton('HIP HOP', 'assets/grey-gradient-4000x4000-19814.png'),
                    SizedBox(width: 1,),
                    genreButton('ROCK', 'assets/orange-gradient-4000x4000-19817.png'),
                    genreButton('CLASSIC', 'assets/grey-purple-4000x4000-19811.png'),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}


