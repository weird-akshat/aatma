import 'package:aatma/edge_widget.dart';
import 'package:aatma/goal_widget.dart';
import 'package:aatma/treenode.dart';
import 'package:flutter/material.dart';

class GraphView extends StatefulWidget {
  final TreeNode root;

  const GraphView({super.key, required this.root});

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  List<Widget> graph = [];
  late Map<TreeNode, Offset> positions;

  @override
  void initState() {
    super.initState();
    positions = tidyTreeLayout(widget.root);

    dfs(widget.root);
  }

  void dfs(TreeNode node) {
    graph.add(GoalWidget(offset: positions[node]!, treeNode: node));

    for (var child in node.children) {
      graph.add(EdgeWidget(from: positions[node]!, to: positions[child]!));
      dfs(child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Stack(
        children: graph,
      ),
    );
  }
}

class _RTTNode {
  final TreeNode treeNode;
  _RTTNode? parent, leftSibling, thread;
  List<_RTTNode> children = [];
  double prelim = 0, modifier = 0;
  _RTTNode(this.treeNode);
}

// Tree layout function
Map<TreeNode, Offset> tidyTreeLayout(
  TreeNode root, {
  double siblingSeparation = 1000,
  double subtreeSeparation = 300,
  double levelSeparation = 500,
}) {
  _RTTNode build(TreeNode tn, _RTTNode? parent) {
    final n = _RTTNode(tn)..parent = parent;
    for (var c in tn.children) {
      final childWrapper = build(c, n);
      if (n.children.isNotEmpty) {
        childWrapper.leftSibling = n.children.last;
      }
      n.children.add(childWrapper);
    }
    return n;
  }

  final wrappedRoot = build(root, null);

  // First pass: Assign preliminary positions to each node
  void firstWalk(_RTTNode v, int depth) {
    if (v.children.isEmpty) {
      // If a node has no children, set its position based on its left sibling
      v.prelim = (v.leftSibling != null)
          ? v.leftSibling!.prelim + siblingSeparation
          : 0;
    } else {
      // If the node has children, recursively position them first
      for (var w in v.children) {
        firstWalk(w, depth + 1);
      }

      // Calculate the middle position of the children for this node
      final mid = (v.children.first.prelim + v.children.last.prelim) / 2;

      // Adjust prelim position based on the left sibling, if it exists
      if (v.leftSibling != null) {
        v.prelim = v.leftSibling!.prelim + siblingSeparation;
        v.modifier = v.prelim - mid; // Shift the node
      } else {
        v.prelim = mid;
      }
    }
  }

  Map<TreeNode, Offset> result = {};
  // Second pass: Assign final positions to each node and propagate adjustments
  void secondWalk(_RTTNode v, double m, int depth) {
    final x = v.prelim + m; // Final X position
    final y = depth * levelSeparation; // Final Y position

    result[v.treeNode] = Offset(x, y); // Store the calculated position

    // Recursively apply secondWalk to the children
    for (var c in v.children) {
      secondWalk(c, m + v.modifier, depth + 1);
    }
  }

  // Map<TreeNode, Offset> result = {}; // This will hold the final positions
  firstWalk(wrappedRoot, 0); // Perform the first pass
  secondWalk(wrappedRoot, 0,
      0); // Perform the second pass with the corrected arguments

  return result; // Return the final calculated positions
}
