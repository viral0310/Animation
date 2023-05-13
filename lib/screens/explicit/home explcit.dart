import 'package:flutter/material.dart';

class ExplicitPage extends StatefulWidget {
  const ExplicitPage({Key? key}) : super(key: key);

  @override
  State<ExplicitPage> createState() => _ExplicitPageState();
}

class _ExplicitPageState extends State<ExplicitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explicit")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/explicitBuiltIn');
              },
              child: const Text("Built in"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/explicitCustom');
              },
              child: const Text("Custom"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/explicitStaggered');
              },
              child: const Text("Staggered"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/explicit_play_pause');
              },
              child: const Text("play pause"),
            ),
          ],
        ),
      ),
    );
  }
}
