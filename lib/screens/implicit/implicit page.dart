import 'package:flutter/material.dart';

class ImplisitPage extends StatefulWidget {
  const ImplisitPage({Key? key}) : super(key: key);

  @override
  State<ImplisitPage> createState() => _ImplisitPageState();
}

class _ImplisitPageState extends State<ImplisitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/builtin");
              },
              child: const Text("Built in"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/custom");
              },
              child: const Text("Custom"),
            ),
          ],
        ),
      ),
    );
  }
}
