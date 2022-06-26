import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:my_app/widget-components/markdownData.dart';
import 'widget-components/customButton.dart';
import 'package:my_app/path-controller.dart';
import 'package:my_app/widget-components/customMarkdown.dart';

class PathWidget extends StatefulWidget {
  const PathWidget({Key? key}) : super(key: key);

  @override
  State<PathWidget> createState() => _PathWidgetState();
}

class _PathWidgetState extends State<PathWidget> {
  PathController controller = PathController();

  MarkdownStyleSheet style = MarkdownStyleSheet(
    h1: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
    tableBody: const TextStyle(fontSize: 18.0),
    p: const TextStyle(fontSize: 18.0),
  );

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MarkdownBody(
                data: controller.currentNode.prompt,
                styleSheet: style,
                selectable: true,
              ),
            ),
            Flex(
              direction: currentWidth < 600 ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: options,
            ),
          ],
        ),
      ),
    );
  }
}
