import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
        centerTitle: true,
        title: Text('MOZX', style: GoogleFonts.redHatDisplay(),),
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
    drawer: Drawer(),
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
    onPressed: () {},
    icon: Icon(Icons.music_note , color: Colors.white,),
    label: Text("MY SONG" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
    style: ElevatedButton.styleFrom( backgroundColor: Colors.grey[800]),
    ),
    ),
    SizedBox(
    width: 190,
    height: 45,
    child : ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.shopping_bag , color: Colors.white,),
    label: Text("SHOP" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
    ),
    ),
    ],
    ),
    SizedBox( height: 5,),
    Center(
    child: Text(
    'MOST POPULAR',
    textAlign: TextAlign.center,
    style: TextStyle(fontWeight: FontWeight.w900 , fontFamily: GoogleFonts.redHatDisplay().fontFamily ,),
    ),
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


