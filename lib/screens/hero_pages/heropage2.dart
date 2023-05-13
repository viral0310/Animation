import 'package:flutter/material.dart';

class HeroPage2 extends StatefulWidget {
  const HeroPage2({Key? key}) : super(key: key);

  @override
  State<HeroPage2> createState() => _HeroPage2State();
}

class _HeroPage2State extends State<HeroPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero page 2"),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Hero(
          tag: 'Home',
          placeholderBuilder: (context, size, _) {
            return const CircularProgressIndicator();
          },
          transitionOnUserGestures: true,
          flightShuttleBuilder: (context, _, direction, __, ___) {
            if (direction == HeroFlightDirection.push) {
              return const Icon(
                Icons.arrow_forward_ios,
                size: 50,
              );
            } else {
              return const Icon(
                Icons.arrow_back_ios_new,
                size: 50,
              );
            }
          },
          child: const Center(
            child: Icon(
              Icons.home,
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
