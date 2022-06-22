import 'package:flutter/material.dart';
import 'package:my_app/customButton.dart';
import 'package:my_app/path-controller.dart';

class PathWidget extends StatefulWidget {
  const PathWidget({Key? key}) : super(key: key);

  @override
  State<PathWidget> createState() => _PathWidgetState();
}

class _PathWidgetState extends State<PathWidget> {
  PathController controller = PathController();

  @override
  Widget build(BuildContext context) {
    List<Widget> options = [];
    for (final element in controller.currentNode.options) {
      Widget button = CustomButton(
          title: element.title,
          onPressed: () {
            setState(() {
              controller.goToNode(element.nextNodeByID, element.title);
            });
          });
      options.add(button);
    }

    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: Column(
        children: [
          const Text("Warfarin Reversal"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.subtitleWidgets,
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.currentNode.prompt,
                style: const TextStyle(
                  fontSize: 24,
                  height: 1.5,
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: options,
            // ),
            Flex(
              direction: currentWidth < 600 ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: options,
            )
          ],
        ),
      ),
    );
  }
}
