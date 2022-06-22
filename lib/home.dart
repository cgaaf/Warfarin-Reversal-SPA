import 'package:flutter/material.dart';
import 'package:my_app/path-widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warfarin Reversal"),
        leading: IconButton(
          icon: const Icon(Icons.back_hand),
          onPressed: () {
            print("Hi");
          },
        ),
      ),
      body: const Center(
        child: PathWidget(),
      ),
    );
  }
}
