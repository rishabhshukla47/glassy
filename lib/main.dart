import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(Glassy());
}

class Glassy extends StatefulWidget {
  @override
  _GlassyState createState() => _GlassyState();
}

class _GlassyState extends State<Glassy> {
  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('change_level');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF000033),
          title: Center(
            child: Text(
              'Glass loader',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Kalam',
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: RiveAnimation.asset(
                  'assets/glass_animation.riv',
                  controllers: [_controller],
                  // Update the play state when the widget's initialized
                  onInit: (_) => setState(() {}),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF000033),
          onPressed: _togglePlay,
          tooltip: isPlaying ? 'Pause' : 'Play',
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
