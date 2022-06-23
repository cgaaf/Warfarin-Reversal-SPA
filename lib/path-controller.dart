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
  List<Widget> subtitleWidgets = [];

  static Set<Node> nodes = {
    // Top level nodes
    Node(
      id: "1",
      prompt: """# What is the INR?""",
      options: [
        NodeOptions(title: "INR < 1.4", nextNodeByID: "2a"),
        NodeOptions(title: "INR > 1.4", nextNodeByID: "2b")
      ],
    ),

    // Level 1 nodes
    Node(
      id: "2a",
      prompt: """
# Recommendations
- Vitamin K 10 mg IV x1 dose
- Recheck INR Q6hrs x 24hrs
""",
      options: [
        NodeOptions(title: "Restart", nextNodeByID: "1"),
      ],
    ),

    Node(
      id: "2b",
      prompt: """# Is there intracranial bleeding?""",
      options: [
        NodeOptions(
            title: "Intracranial bleeding present", nextNodeByID: "3ba"),
        NodeOptions(title: "No intracranial bleeding", nextNodeByID: "3bb")
      ],
    ),

    // Level 2 nodes
    Node(
      id: "3ba",
      prompt: """
# Recommendations
- Vitamin K 10mg IV x1 dose, may repeat Q24hrs as needed
- 4-Factor PCC (Kcentra) - Dosing based on INR (see chart below) ***DO NOT REPEAT***
- Repeat INR 1 hour after end of PCC infusion, then Q6hrs x 24hrs
- If repeat INR > 1.4, give FFP 15 mL/kg STAT


| **INR**   | **4 Factor PCC (KCentra) Dosing** |
| --------- | --------------------------------- |
| 1.4 - 3.9 | 25 units/kg, max 2500 units       |
| 4 - 5.9   | 35 units/kg, max 3500 units       |
| ≥ 6       | 50 units/kg, max 5000 units       |
| Unknown   | 50 units/kg, max 5000 units       |
""",
      options: [
        NodeOptions(title: "Restart", nextNodeByID: "1"),
      ],
    ),

    Node(
      id: "3bb",
      prompt: """
# Recommendations
- Vitamin K 10mg IV x1 dose, may repeat Q24hrs as needed
- 4-Factor PCC (KCentra) 25 units/kg, max 2500 units
- Repeat INR 1 hour after end of PCC infusion, then Q6hrs x 24hrs
- If repeat INR > 1.4, give FFP 15 mL/kg STAT
""",
      options: [
        NodeOptions(title: "Restart", nextNodeByID: "1"),
      ],
    )
  };

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
    buildSubtitleWidgets(subtitleElement);
  }
}
