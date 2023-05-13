import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CustomImplicitPage extends StatefulWidget {
  const CustomImplicitPage({Key? key}) : super(key: key);

  @override
  State<CustomImplicitPage> createState() => _CustomImplicitPageState();
}

class _CustomImplicitPageState extends State<CustomImplicitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 460),
              curve: Curves.bounceOut,
              duration: const Duration(
                milliseconds: 3000,
              ),
              builder: (context, offsetVal, child) {
                return Transform.translate(
                  offset: Offset(0, offsetVal),
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    curve: Curves.easeInOut,
                    duration: const Duration(
                      milliseconds: 3000,
                    ),
                    builder: (context, degreeValue, child) {
                      return Transform.rotate(
                          angle: degreeValue,
                          child: TweenAnimationBuilder(
                            tween: ColorTween(
                                begin: Colors.redAccent,
                                end: Colors.blueAccent),
                            duration: Duration(milliseconds: 3000),
                            builder: (context, Color? colorVal, child) {
                              return ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    colorVal!, BlendMode.dstATop),
                                child: Image.asset(
                                  'assets/img_19509.png',
                                  height: 200,
                                  width: 200,
                                ),
                              );
                            },
                          ));
                    },
                  ),
                );
              },
            ),
            // TweenAnimationBuilder(
            //     tween: Tween<double>(begin: 0, end: 2 * pi),
            //     curve: Curves.easeInOut,
            //     duration: const Duration(
            //       milliseconds: 3000,
            //     ),
            //     builder: (context, value, child) {
            //       return Transform.rotate(
            //         angle: value,
            //         child: Image.asset(
            //           'assets/img_19509.png',
            //           height: 200,
            //           width: 200,
            //         ),
            //       );
            //     })
          ],
        ),
      ),
    );
  }
}
