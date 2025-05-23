import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'Password.dart';

class NowPlayingPage extends StatefulWidget {
  final Song song;
  const NowPlayingPage({required this.song});

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _playSong() async {
    await _player.play(AssetSource(widget.song.assetPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('MOZX',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
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
            Text(widget.song.title,
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            Text(widget.song.artist, style: TextStyle(color: Colors.grey[400], fontSize: 16)),
            const SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
              onPressed: _playSong,
            ),
          ],
        ),
      ),
    );
  }
}
