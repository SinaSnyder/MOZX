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
import 'package:MOZX/mozx/song.dart';


class SongSearchPage extends StatefulWidget {
  const SongSearchPage({super.key});

  @override
  State<SongSearchPage> createState() => _SongSearchPageState();
}

class _SongSearchPageState extends State<SongSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Song> _results = [];

  final allSongs = [
    ...localSongs,
    ...mySongs,
    ...RockSongs,
    ...PopSongs,
    ...HipHopSongs,
    ...PersianSongs,
  ];

  void _performSearch(String query) {
    final regex = RegExp(query.trim(), caseSensitive: false);
    setState(() {
      _results = allSongs.where((song) => regex.hasMatch(song.title)).toList();
    });
  }

  bool _isLocal(Song song) {
    return localSongs.contains(song) || mySongs.contains(song);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("MOZX", style: GoogleFonts.redHatDisplay(color: Colors.white , fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _performSearch,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'search....',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: _results.isEmpty
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sentiment_dissatisfied, size: 64, color: Colors.white),
                  SizedBox(height: 12),
                  Text('No Results Found', style: TextStyle(color: Colors.white)),
                ],
              )
                  : ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final song = _results[index];
                  return ListTile(
                    leading: Image.asset(song.coverPath, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(song.title, style: GoogleFonts.redHatDisplay(color: Colors.white)),
                    subtitle: Text(song.artist, style: GoogleFonts.redHatDisplay(color: Colors.white70)),
                    trailing: Text(
                      song.price.toLowerCase() == "free" ? "FREE" : '\$${song.price}',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      if (_isLocal(song)) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (_) => NowPlayingPage(song: song),
                        ));
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (_) => PurchasePage(song: song),
                        ));
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
