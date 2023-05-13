import 'package:flutter/material.dart';

class PlayPause extends StatefulWidget {
  const PlayPause({Key? key}) : super(key: key);

  @override
  State<PlayPause> createState() => _PlayPauseState();
}

class _PlayPauseState extends State<PlayPause>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.3,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation")),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildCircularContainer(200),
          _buildCircularContainer(250),
          _buildCircularContainer(300),
          Align(
              child: CircleAvatar(
                  backgroundImage: AssetImage("assets/img_19509.png"),
                  radius: 72)),
          Align(
            alignment: Alignment(0, 0.5),
            child: ElevatedButton(
              child: Text(_isPlaying ? "STOP" : "START"),
              onPressed: () {
                if (_isPlaying)
                  _controller.reset();
                else
                  _controller.repeat();
                setState(() => _isPlaying = !_isPlaying);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularContainer(double radius) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
          parent: _controller, curve: Curves.fastLinearToSlowEaseIn),
      builder: (context, child) {
        return Container(
          width: _controller.value * radius,
          height: _controller.value * radius,
          decoration: BoxDecoration(
              color: Colors.black54.withOpacity(1 - _controller.value),
              shape: BoxShape.circle),
        );
      },
    );
  }
}
