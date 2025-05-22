import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:MOZX/mozx/password.dart';

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

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _initAudioPlayer() async {
    await _player.setSource(AssetSource(widget.song.assetPath));


    await _player.setReleaseMode(ReleaseMode.stop);


    _player.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration ?? Duration.zero;
      });
    });


    _player.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });


    _player.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });
  }

  void _playOrPause() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('MOZX', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {},
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.music_note, color: Colors.white),
                      SizedBox(width: 5),
                      Text('MY SONG', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag, color: Colors.white),
                      SizedBox(width: 5),
                      Text('SHOP', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.song.coverPath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.song.title,
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.song.artist,
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
            const SizedBox(height: 40),
            Slider(
              value: _position.inSeconds.toDouble(),
              min: 0,
              max: _duration.inSeconds.toDouble(),
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              onChanged: (value) async {
                await _player.seek(Duration(seconds: value.toInt()));
                setState(() {
                  _position = Duration(seconds: value.toInt());
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.repeat, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 40, color: Colors.white),
                  onPressed: _playOrPause,
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}