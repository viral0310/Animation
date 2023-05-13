import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitStaggeredPage extends StatefulWidget {
  const ExplicitStaggeredPage({Key? key}) : super(key: key);

  @override
  State<ExplicitStaggeredPage> createState() => _ExplicitStaggeredPageState();
}

class _ExplicitStaggeredPageState extends State<ExplicitStaggeredPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      //lowerBound: 0,
      // upperBound: 2 * pi,
    );

    // sizeAnimation = Tween<double>(
    //   begin: 250,
    //   end: 50,
    // ).animate(animationController);
    //
    // colorAnimation = ColorTween(end: Colors.green, begin: Colors.blueAccent)
    //     .animate(animationController);

    // sizeAnimation = Tween<double>(
    //   begin: 250,
    //   end: 50,
    // ).animate(
    //     CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    //
    // colorAnimation = ColorTween(end: Colors.green, begin: Colors.blueAccent)
    //     .animate(CurvedAnimation(
    //         parent: animationController, curve: Curves.easeInOut));

    sizeAnimation = Tween<double>(
      begin: 250,
      end: 50,
    ).animate(CurvedAnimation(
        parent: animationController, curve: const Interval(0, 0.5)));

    colorAnimation = ColorTween(end: Colors.green, begin: Colors.blueAccent)
        .animate(CurvedAnimation(
            parent: animationController, curve: const Interval(0.5, 1)));

    // sizeAnimation = TweenSequence([
    //   TweenSequenceItem(
    //       tween: Tween<double>(
    //         begin: 250,
    //         end: 50,
    //       ),
    //       weight: 1),
    //   TweenSequenceItem(
    //       tween: Tween<double>(
    //         begin: 50,
    //         end: 350,
    //       ),
    //       weight: 1),
    //   TweenSequenceItem(
    //       tween: Tween<double>(
    //         begin: 350,
    //         end: 100,
    //       ),
    //       weight: 1),
    //   TweenSequenceItem(
    //       tween: Tween<double>(
    //         begin: 100,
    //         end: 50,
    //       ),
    //       weight: 1),
    // ]).animate(
    //   CurvedAnimation(
    //     parent: animationController,
    //     curve: Interval(
    //       0,
    //       0.5,
    //       //curve: Curves.bounceInOut,
    //     ),
    //   ),
    // );
    //
    // colorAnimation =
    //     ColorTween(end: Colors.green, begin: Colors.blueAccent).animate(
    //   CurvedAnimation(
    //     parent: animationController,
    //     curve: Interval(
    //       0.5,
    //       1,
    //       //curve: Curves.bounceOut,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: animationController,
                builder: (context, widget) {
                  return Container(
                    height: sizeAnimation.value,
                    width: sizeAnimation.value,
                    color: colorAnimation.value,
                  );
                }),
            ElevatedButton(
                onPressed: () {
                  animationController.forward();
                },
                child: const Text("Animate")),
            ElevatedButton(
                onPressed: () {
                  animationController.reverse();
                },
                child: const Text("Reverse Animate")),
            ElevatedButton(
                onPressed: () {
                  animationController.repeat();
                },
                child: const Text("Repeat")),
            ElevatedButton(
                onPressed: () {
                  animationController.stop();
                },
                child: const Text("Stop")),
            ElevatedButton(
                onPressed: () {
                  animationController.repeat(reverse: true);
                  //animationController.repeat();
                },
                child: const Text("task")),
          ],
        ),
      ),
    );
  }
}
