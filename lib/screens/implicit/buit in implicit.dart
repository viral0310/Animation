import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BuitInExlicit extends StatefulWidget {
  const BuitInExlicit({Key? key}) : super(key: key);

  @override
  State<BuitInExlicit> createState() => _BuitInExlicitState();
}

class _BuitInExlicitState extends State<BuitInExlicit>
    with SingleTickerProviderStateMixin {
  // animatedContainer
  double h = 200;
  double w = 200;
  double r = 20;
  Color color = Colors.teal;
  //AnimatedOpacity
  double height = 200;
  double width = 200;
  double opacity = 1;
  //AnimatedCrossFade
  bool _bool = true;
  //continues animation
  late AnimationController animationController;
  int second = 1;

  int timer() {
    setState(
      () {
        Timer(
          Duration(seconds: second++),
          () {
            height = (height == 200) ? 150 : 200;
            width = (width == 200) ? 150 : 200;
            opacity = (opacity == 0) ? 1 : 0;
          },
        );
      },
    );
    return second;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Built in Explicit"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(microseconds: 2000),
                child: Container(
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(r),
                    color: color,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      final random = Random();

                      h = (h == 200) ? random.nextInt(300).toDouble() : 200;
                      w = (w == 200) ? random.nextInt(300).toDouble() : 200;
                      r = (r == 20) ? random.nextInt(50).toDouble() : 20;
                      color = Color.fromRGBO(random.nextInt(200),
                          random.nextInt(300), random.nextInt(500), 1);
                      animationController..repeat(reverse: true);
                    });
                  },
                  icon: const Icon(Icons.play_arrow)),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 3000),
                opacity: opacity,
                curve: Curves.easeIn,
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.amber,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    timer();
                  },
                  child: const Text("play")),
              AnimatedCrossFade(
                firstChild: Container(
                  height: 150,
                  width: 150,
                  color: Colors.green,
                ),
                secondChild: const CircleAvatar(
                    maxRadius: 80, backgroundColor: Colors.blueAccent),
                firstCurve: Curves.linear,
                secondCurve: Curves.linear,
                duration: const Duration(milliseconds: 2000),
                crossFadeState: _bool
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _bool = !_bool;
                      },
                    );
                  },
                  child: const Text("start"))
            ],
          ),
        ),
      ),
    );
  }
}
