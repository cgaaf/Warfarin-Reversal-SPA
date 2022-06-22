import 'package:flutter/material.dart';

class Node {
  final String id;
  final String prompt;
  final List<NodeOptions> options;

  Node({required this.id, required this.prompt, required this.options});
}

class NodeOptions {
  final String title;
  final String nextNodeByID;

  NodeOptions({required this.title, required this.nextNodeByID});
}

class PathController {
  Node currentNode = nodes.firstWhere((element) => element.id == "1");
  String subtitle = "";
  List<Widget> subtitleWidgets = [];

  static Set<Node> nodes = {
    // Top level nodes
    Node(
      id: "1",
      prompt: "What is the INR?",
      options: [
        NodeOptions(title: "INR < 1.4", nextNodeByID: "2a"),
        NodeOptions(title: "INR > 1.4", nextNodeByID: "2b")
      ],
    ),

    // Level 1 nodes
    Node(
      id: "2a",
      prompt: "Vitamin K 10 mg IV x1 dose \nRecheck INR Q6hrs x 24hrs",
      options: [
        NodeOptions(title: "Restart", nextNodeByID: "1"),
      ],
    ),

    Node(
      id: "2b",
      prompt: "Is there intracranial bleeding?",
      options: [
        NodeOptions(
            title: "Intracranial bleeding present", nextNodeByID: "3ba"),
        NodeOptions(title: "No intracranial bleeding", nextNodeByID: "3bb")
      ],
    ),

    // Level 2 nodes
    Node(
      id: "3ba",
      prompt:
          "Vitamin K 10mg IV x1 dose, may repeat Q24hrs as needed \n4-Factor Prothrombin Complex Concentrate (PCC)- Kcentra Dosing based on INR \nRepeat INR 1 hour after end of PCC infusion, then Q6hrs x 24hrs \nIf repeat INR > 1.4, give FFP 15 mL/kg STAT",
      options: [
        NodeOptions(title: "Restart", nextNodeByID: "1"),
      ],
    ),

    Node(
      id: "3bb",
      prompt: """
          Vitamin K 10mg IV x1 dose, may repeat Q24hrs as needed
          4-Factor Prothrombin Complex Concentrate (PCC)- Kcentra 25 units/kg, max 2500 units
          Repeat INR 1 hour after end of PCC infusion, then Q6hrs x 24hrs
          If repeat INR > 1.4, give FFP 15 mL/kg STAT
          """,
      options: [
        NodeOptions(title: "Restart", nextNodeByID: "1"),
      ],
    )
  };

  Node getNextNodeByID(String id) {
    return nodes.firstWhere((element) => element.id == id);
  }

  void buildSubtitleWidgets(String textElement) {
    if (textElement == "Restart") {
      subtitleWidgets = [];
    } else if (subtitleWidgets.isEmpty) {
      subtitleWidgets.add(Text(
        textElement,
        textScaleFactor: 0.8,
      ));
    } else {
      subtitleWidgets.add(const Icon(
        Icons.arrow_forward_sharp,
        size: 15,
      ));
      subtitleWidgets.add(Text(
        textElement,
        textScaleFactor: 0.8,
      ));
    }
  }

  void goToNode(String id, String subtitleElement) {
    currentNode = nodes.firstWhere((element) => element.id == id);
    // if (subtitleElement == "Restart") {
    //   subtitle = "";
    // } else if (subtitle == "") {
    //   subtitle = subtitleElement;
    // } else {
    //   subtitle += " * $subtitleElement";
    // }
    buildSubtitleWidgets(subtitleElement);
  }
}
