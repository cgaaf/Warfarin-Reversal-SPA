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
              controller.goToNode(element.nextNodeByID);
            });
          });
      options.add(button);
    }

    return Column(
      children: [
        Text(controller.currentNode.prompt),
        Row(
          children: options,
        )
      ],
    );
  }
}
