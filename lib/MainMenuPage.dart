import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'MySongPage.dart';
import 'ShopPage.dart';

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
                  onTap: () {},
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
        body: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search' , suffixStyle: GoogleFonts.redHatDisplay(),
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 190,
                      height: 45,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MySongPage()),
                          );
                        },
                        icon: Icon(Icons.music_note , color: Colors.white,),
                        label: Text("MY SONGS" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
                        style: ElevatedButton.styleFrom( backgroundColor: Colors.grey[800]),
                      ),
                    ),
                    SizedBox(
                      width: 190,
                      height: 45,
                      child : ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShopPage()),
                          );
                        },
                        icon: Icon(Icons.shopping_bag , color: Colors.white,),
                        label: Text("SHOP" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
                SizedBox( height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('MOST POPULAR' , style: GoogleFonts.redHatDisplay(fontWeight: FontWeight.w900 , fontSize: 20),),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.sort , color: Colors.white,),
                      onSelected: (value) {
                        print('sort by $value');
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem<String>(
                            value: 'Name',
                            child: Text('sort by Name'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Date',
                            child: Text('sort by Date'),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
                Divider(color: Colors.white,),
                Expanded(
                  child: GridView.builder(
                    itemCount: 7,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 4 / 4,
                    ) ,
                    itemBuilder: (context,index) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.grey[800],
                                child: Center(child: Text('COVER')),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
        )
    );
  }
}















