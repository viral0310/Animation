import 'package:flutter/material.dart';

class ExplicitBuitInPage extends StatefulWidget {
  const ExplicitBuitInPage({Key? key}) : super(key: key);

  @override
  State<ExplicitBuitInPage> createState() => _ExplicitBuitInPageState();
}

class _ExplicitBuitInPageState extends State<ExplicitBuitInPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
      // lowerBound: 0,
      // upperBound: 1
    );
    _animation = Tween<Offset>(
      // begin: const Offset(-0.5, 0.0),
      // end: const Offset(0.5, 0.0),
      begin: const Offset(-3, 1),
      end: const Offset(3, -0.001),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*  RotationTransition(
              turns: animationController,
              child: Image.asset(
                'assets/img_19509.png',
                height: 200,
                width: 200,
              ),
            ),*/
            SlideTransition(
              position: _animation,
              child: Image.asset(
                'assets/travelling.png',
                height: 500,
                width: 50,
              ),
            ),
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
            ElevatedButton(
                onPressed: () {
                  animationController..repeat(reverse: true);
                },
                child: Text("task")),
          ],
        ),
      ),
    );
  }
}
