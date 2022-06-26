import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget-components/customButton.dart';
import 'package:my_app/path-controller.dart';

class PathWidget extends StatefulWidget {
  const PathWidget({Key? key}) : super(key: key);

  @override
  State<PathWidget> createState() => _PathWidgetState();
}

class _PathWidgetState extends State<PathWidget> {
  PathController controller = PathController();

  MarkdownStyleSheet style = MarkdownStyleSheet(
      h1: GoogleFonts.openSans(fontSize: 30.0, fontWeight: FontWeight.w500),
      tableBody: GoogleFonts.openSans(fontSize: 18.0),
      p: GoogleFonts.openSans(fontSize: 18.0));

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
          mainAxisAlignment: MainAxisAlignment.center,
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
