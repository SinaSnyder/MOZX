import 'package:MOZX/mozx/Profile.dart';
import 'package:MOZX/mozx/password.dart';
import 'package:MOZX/mozx/NowPlayingPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 190,
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
                    SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        width: 190,
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
                  height: 200,
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
                          width: 150,
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
                  height: 200,
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
                          width: 150,
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


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'MOZX',
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'LOG IN',
                style: GoogleFonts.interTight(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Enter Username or Email',
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              PasswordField(controller: passwordController),
              SizedBox(height: 20),
              SizedBox(
                width: 360,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please complete every field of the form'),
                          backgroundColor: Colors.white,
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainMenuPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Text(
                    'Log in',
                    style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'forgot password?',
                  style: GoogleFonts.redHatDisplay(color: Colors.blue),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: Text(
                  'or sign up',
                  style: GoogleFonts.redHatDisplay(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'MOZX',
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'SIGN UP',
                style: GoogleFonts.interTight(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: usernameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Username',
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.email_rounded, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: phoneController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.phone, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              PasswordField(controller: passwordController),
              SizedBox(height: 20),
              ConfirmPassword(controller: confirmPasswordController),
              SizedBox(height: 20),
              SizedBox(
                width: 360,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please complete every field of the form'),
                          backgroundColor: Colors.white,
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'or Log in',
                  style: GoogleFonts.redHatDisplay(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



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
                    onPressed: () {},
                    icon: Icon(Icons.music_note , color: Colors.white,),
                    label: Text("MY SONGS" , style: GoogleFonts.redHatDisplay(color: Colors.white , fontSize: 15),),
                    style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white), backgroundColor: Color.fromARGB(255, 20, 20, 20) , foregroundColor: Colors.white ,),
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ShopPage()));
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


