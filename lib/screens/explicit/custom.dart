import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitCustomPage extends StatefulWidget {
  const ExplicitCustomPage({Key? key}) : super(key: key);

  @override
  State<ExplicitCustomPage> createState() => _ExplicitCustomPageState();
}

class _ExplicitCustomPageState extends State<ExplicitCustomPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
      lowerBound: 0,
      upperBound: 2 * pi,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("custom"),
        actions: [
          IconButton(
              onPressed: () {
                animationController.reset();
              },
              icon: Icon(
                Icons.refresh_outlined,
                size: 30,
              ))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: animationController,
                child: Image.asset(
                  'assets/img_19509.png',
                  height: 200,
                  width: 200,
                ),
                builder: (context, widget) {
                  return Transform.rotate(
                    angle: animationController.value,
                    child: widget,
                  );
                }),
            ElevatedButton(
                onPressed: () {
                  animationController.forward();
                },
                child: Text("Animate")),
            ElevatedButton(
                onPressed: () {
                  animationController.reverse();
                },
                child: Text("Reverse Animate")),
            ElevatedButton(
                onPressed: () {
                  animationController.repeat();
                },
                child: Text("Repeat")),
            ElevatedButton(
                onPressed: () {
                  animationController.stop();
                },
                child: Text("Stop")),
          ],
        ),
      ),
    );
  }
}
