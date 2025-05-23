import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'ShopPage.dart';
import 'MainMenuPage.dart';

class MySongPage extends StatelessWidget {
  const MySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    final songs = List.generate(10, (index) => {
      'title' : 'SONG NAME' ,
      'singer' : 'SINGER' ,
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 20, 20) ,
        centerTitle: true,
        title: Text('MOZX' , style: GoogleFonts.redHatDisplay(fontWeight: FontWeight.bold)),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.person),
          ),
          SizedBox(width: 20,),
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
                    Text("NAME" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined, color: Colors.white),
                title: Text('Home', style: GoogleFonts.redHatDisplay(color: Colors.white)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenuPage()),
                  );
                },
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
                    onPressed: () {},
                    icon: Icon(Icons.music_note , color: Colors.white,),
                    label: Text("MY SONGS" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
                    style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white), backgroundColor: Color.fromARGB(255, 20, 20, 20) , foregroundColor: Colors.white ,),

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
            SizedBox( height : 5,),
            Align(
              alignment: Alignment.center,
              child: Text('MY SONGS' , style: GoogleFonts.redHatDisplay(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.white),),
            ),
            Divider(color: Colors.white,),
            Expanded(
                child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                        leading:ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey,
                            child: Center(
                              child: Text('song\npicture', textAlign: TextAlign.center, style: TextStyle(fontSize: 10),),
                            ),
                          ),
                        ),
                        title: Text(songs[index]['title']! ,style: GoogleFonts.redHatDisplay(color: Colors.white),),
                        subtitle: Text(songs[index]['singer']! , style: GoogleFonts.redHatDisplay(color: Colors.white70),),
                      );
                    }
                )
            ),
          ],
        ),
      ),
    );
  }
}