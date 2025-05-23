import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Text('LOG IN' , style:  GoogleFonts.interTight(fontSize: 28 , fontWeight: FontWeight.bold , color: Colors.white),),
              SizedBox(height: 40,),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Username or Email',
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 360,
                height: 45,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue ,shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(13)) ),
                    child: Text('Log in' , style: GoogleFonts.redHatDisplay(fontWeight: FontWeight.bold , fontSize: 16 , color: Colors.white),)
                ),
              ),
              SizedBox(height: 10,),
              TextButton(
                onPressed: () {},
                child: Text('forgot password?' , style: GoogleFonts.redHatDisplay(color: Colors.blue),),
              ),
              TextButton(
                onPressed: () {},
                child: Text('or sign up' , style: GoogleFonts.redHatDisplay(color : Colors.blue , decoration: TextDecoration.underline),),
              )
            ],
          )
      ),
    );
  }
}