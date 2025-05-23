import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'MySongPage.dart';
import 'MainMenuPage.dart';
import 'Profile.dart';




class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
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
                SizedBox(
                  width: 70,
                  height: 45,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainMenuPage()),
                      );
                    },
                    icon: Icon(Icons.home , color: Colors.white,),
                    style: OutlinedButton.styleFrom( backgroundColor: Colors.grey[800],),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 45,
                  child : ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_bag , color: Colors.white,),
                    label: Text("SHOP" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
                    style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.white), backgroundColor: Color.fromARGB(255, 20, 20, 20) , foregroundColor: Colors.white ,),
                  ),
                ),
              ],
            ),
            SizedBox( height : 5,),
            Expanded(
                child: ListView(
                  children: [
                    _buildCategoryButton(
                      context,
                      imagePath: 'assets/Picsart_25-05-21_14-27-49-496.jpg',
                      label: 'PERSIAN',
                      onTap: () {},
                    ),
                    _buildCategoryButton(
                      context,
                      imagePath: 'assets/Picsart_25-05-21_14-29-04-583.jpg',
                      label: 'ROCK',
                      onTap: () {},
                    ),
                    _buildCategoryButton(
                      context,
                      imagePath: 'assets/Picsart_25-05-21_14-26-58-835.jpg',
                      label: 'POP',
                      onTap: () {},
                    ),
                    _buildCategoryButton(
                      context,
                      imagePath: 'assets/Picsart_25-05-21_14-29-57-165.jpg',
                      label: 'HIP HOP',
                      onTap: () {},
                    ),
                    _buildCategoryButton(
                      context,
                      imagePath: 'assets/Picsart_25-05-21_14-30-41-081.jpg',
                      label: 'CLASSIC',
                      onTap: () {},
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}


Widget _buildCategoryButton(BuildContext context, {
  required String imagePath,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 160,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: GoogleFonts.redHatDisplay(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 10,
              color: Colors.black,
              offset: Offset(2, 2),
            ),
          ],
        ),
      ),
    ),
  );
}


