import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/hero_page_1');
              },
              child: const Text("Hero Widget"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/implicit');
              },
              child: const Text("Implicit Animation"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/explicit');
              },
              child: const Text("Explicit Animation"),
            ),
          ],
        ),
      ),
    );
  }
}
