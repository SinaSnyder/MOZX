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


class NowPlayingPage extends StatefulWidget {
  final Song song;

  const NowPlayingPage({required this.song});

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  late AudioPlayer _player;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isPlaying = false;
  double _sliderMax = 1.0;
  bool _isLiked = false;
  bool _isRepeatOne = false;
  bool _isShuffle = false;


  late List<Song> _songs;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _songs = AllMYSongs;
    _currentIndex = _songs.indexWhere((song) => song.title == widget.song.title && song.assetPath == widget.song.assetPath);

    if (_currentIndex == -1) {
      _songs.insert(0, widget.song);
      _currentIndex = 0;
    }

    _player = AudioPlayer();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    _player.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
        _sliderMax = duration.inSeconds.toDouble().clamp(1.0, double.infinity);
      });
    });

    _player.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    _player.onPlayerComplete.listen((event) async {
      if (_isRepeatOne) {
        await _player.stop();
        await _player.play(AssetSource(_songs[_currentIndex].assetPath));
      } else {
        _playNext();
      }
    });

    _player.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    await _player.play(AssetSource(_songs[_currentIndex].assetPath));
  }

  void _playOrPause() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.resume();
    }
  }

  void _playNext() {
    setState(() {
      if (_isShuffle) {
        int nextIndex;
        do {
          nextIndex = (List.generate(_songs.length, (index) => index)..shuffle()).first;
        } while (nextIndex == _currentIndex && _songs.length > 1);
        _currentIndex = nextIndex;
      } else if (_currentIndex < _songs.length - 1) {
        _currentIndex++;
      }
    });
    _loadAndPlay();
  }

  void _playPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _loadAndPlay();
    }
  }

  Future<void> _loadAndPlay() async {
    await _player.stop();
    await _player.play(AssetSource(_songs[_currentIndex].assetPath));
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _songs[_currentIndex].likes++;
      } else {
        _songs[_currentIndex].likes = (_songs[_currentIndex].likes - 1).clamp(0, double.infinity).toInt();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentSong = _songs[_currentIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text('MOZX', style: GoogleFonts.redHatDisplay(fontWeight: FontWeight.bold)),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              if (UserData.isLoggedIn) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
              }
            },
            icon: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Navigation buttons
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
                    icon: const Icon(Icons.music_note, color: Colors.white),
                    label: Text("MY SONGS", style: GoogleFonts.redHatDisplay(color: Colors.white, fontSize: 15)),
                    style: OutlinedButton.styleFrom(backgroundColor: Colors.grey[800]),
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 45,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
                    },
                    icon: const Icon(Icons.home, color: Colors.white),
                    style: OutlinedButton.styleFrom(backgroundColor: Colors.grey[800]),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (UserData.isLoggedIn) {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ShopPage()));
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                      }
                    },
                    icon: const Icon(Icons.shopping_bag, color: Colors.white),
                    label: Text("SHOP", style: GoogleFonts.redHatDisplay(color: Colors.white, fontSize: 15)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Cover Art
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(currentSong.coverPath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const SizedBox(height: 20),
            // Title & Artist
            Text(currentSong.title, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            Text(currentSong.artist, style: TextStyle(color: Colors.grey[400], fontSize: 16)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDuration(_position), style: const TextStyle(color: Colors.white, fontSize: 12)),
                  Text(_formatDuration(_duration), style: const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
            // Progress slider
            Slider(
              value: _position.inSeconds.clamp(0, _sliderMax.toInt()).toDouble(),
              min: 0,
              max: _sliderMax,
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              onChanged: (value) async {
                await _player.seek(Duration(seconds: value.toInt()));
              },
            ),
            const SizedBox(height: 20),
            // Control Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous_rounded, color: Colors.white , size: 60,),
                      onPressed: _playPrevious,
                    ),
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                      onPressed: _playOrPause,
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next_rounded, size: 60, color: Colors.white),
                      onPressed: _playNext,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.shuffle, color: _isShuffle ? Colors.blueAccent : Colors.white),
                      onPressed: () {
                        setState(() {
                          _isShuffle = !_isShuffle;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(_isRepeatOne ? Icons.repeat_one_rounded : Icons.repeat_rounded, color: Colors.white),
                      onPressed: () => setState(() => _isRepeatOne = !_isRepeatOne),
                    ),
                    IconButton(
                      icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border, color: _isLiked ? Colors.red : Colors.white),
                      onPressed: _toggleLike,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text("Likes: ${currentSong.likes}", style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}

