import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:MOZX/mozx/LogInPage.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('MOZX' , style: GoogleFonts.redHatDisplay(fontWeight: FontWeight.w900),),
        centerTitle: true,
      ),
      body: Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 184, 0, 0),
        Color.fromARGB(255, 144, 0, 0),
        Color.fromARGB(255, 120, 0, 0),
        Color.fromARGB(255, 100, 0, 0),
        Color.fromARGB(255, 75, 0, 0),
        Color.fromARGB(255, 52, 0, 0),
        Color.fromARGB(255, 25, 0, 0),
        Colors.black,
      ],
    ),
    ),
    child: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(22.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    SizedBox(height: 40),
    Text(
    'SIGN IN',
    style: GoogleFonts.interTight(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),
    SizedBox(height: 40),
    TextField(
    decoration: InputDecoration(
    hintText: 'Enter Username',
    prefixIcon: Icon(Icons.person),
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
    ),
    ),
    ),
    SizedBox(height: 20),
    TextField(
    decoration: InputDecoration(
    hintText: 'Enter Email',
    prefixIcon: Icon(Icons.email_rounded),
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
    ),
    ),
    ),
    SizedBox(height: 20),
    TextField(
    decoration: InputDecoration(
    hintText: 'Enter Phone Number',
    prefixIcon: Icon(Icons.phone),
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
    ),
    ),
    ),
    SizedBox(height: 20),
    TextField(
    decoration: InputDecoration(
    hintText: 'Enter Password',
    prefixIcon: Icon(Icons.lock),
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
    ),
    ),
    ),
    SizedBox(height: 20),
    SizedBox(
    width: 360,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Text(
          'Sign in',
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    ),
    ],
    ),
    ),
    ),
      ),
    );
  }
}
