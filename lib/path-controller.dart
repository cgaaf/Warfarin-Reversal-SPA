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
      prompt: "Vitamin K 10 mg IV x1 dose, Recheck INR Q6hrs x 24hrs",
      options: [
        NodeOptions(title: "Restart", nextNodeByID: "1"),
      ],
    ),

    Node(
      id: "2b",
      prompt: "Is there intracranial bleeding?",
      options: [
        NodeOptions(title: "Yes", nextNodeByID: "1"),
        NodeOptions(title: "No", nextNodeByID: "1")
      ],
    )
  };

  Node getNextNodeByID(String id) {
    return nodes.firstWhere((element) => element.id == id);
  }

  void goToNode(String id) {
    currentNode = nodes.firstWhere((element) => element.id == id);
  }
}
