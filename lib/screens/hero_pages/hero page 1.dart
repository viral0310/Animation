import 'package:flutter/material.dart';

class HeroPage1 extends StatefulWidget {
  const HeroPage1({Key? key}) : super(key: key);

  @override
  State<HeroPage1> createState() => _HeroPage1State();
}

class _HeroPage1State extends State<HeroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero page 1"),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/hero_page_2');
        },
        child: Hero(
          tag: 'Home',
          placeholderBuilder: (context, size, _) {
            return const CircularProgressIndicator();
          },
          transitionOnUserGestures: true,
          flightShuttleBuilder: (context, _, direction, __, ___) {
            if (direction == HeroFlightDirection.pop) {
              return const Icon(
                Icons.abc,
                size: 80,
              );
            } else {
              return const Icon(
                Icons.ac_unit,
                size: 80,
              );
            }
          },
          child: const Icon(
            Icons.home,
            size: 200,
          ),
        ),
      ),
    );
  }
}
