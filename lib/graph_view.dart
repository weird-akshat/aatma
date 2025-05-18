import 'dart:math';

import 'package:aatma/edge_widget.dart';
import 'package:aatma/goal_widget.dart';
import 'package:aatma/goal_widget_size.dart';
import 'package:aatma/stack_size.dart';
import 'package:aatma/treenode.dart';
import 'package:flutter/material.dart';

class GraphView extends StatefulWidget {
  final TreeNode root;

  const GraphView({super.key, required this.root});

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  List<Widget> goals = [];
  List<Widget> edges = [];
  late Map<TreeNode, Offset> positions;

  double findTreeWidth(Map<TreeNode, Offset> map) {
    double max = 0;
    double min = double.maxFinite;

    for (var entry in map.entries) {
      if (entry.value.dx > max) {
        max = entry.value.dx;
      } else if (entry.value.dx < min) {
        min = entry.value.dx;
      }
    }
    return max + GOAL_WIDGET_WIDTH;
  }

  int findTreeHeight(TreeNode node) {
    if (node == null) {
      return 0;
    } else {
      int max = 0;
      for (TreeNode child in node.children) {
        int x = findTreeHeight(child);
        if (x > max) {
          max = x;
        }
      }
      return max + 1;
    }
  }

  @override
  void initState() {
    super.initState();
    positions = tidyTreeLayout(widget.root);
    stackWidth = findTreeWidth(positions) + 50;
    stackHeight = (findTreeHeight(widget.root)) * levelSeparation + 50;

    dfs(widget.root);
  }

  void dfs(TreeNode node) {
    goals.add(GoalWidget(offset: positions[node]!, treeNode: node));

    for (var child in node.children) {
      edges.add(EdgeWidget(
          from: positions[node]! +
              Offset(GOAL_WIDGET_WIDTH / 2, GOAL_WIDGET_HEIGHT / 2),
          to: positions[child]! +
              Offset(GOAL_WIDGET_WIDTH / 2, GOAL_WIDGET_HEIGHT / 2)));
      dfs(child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 0.05,
      // boundaryMargin: const EdgeInsets.all(2000),

      constrained: false,
      scaleEnabled: true,
      child: SizedBox(
          width: stackWidth,
          height: stackHeight,
          child: Stack(children: edges + goals)),
    );
  }
}

class _RTTNode {
  final TreeNode treeNode;
  _RTTNode? parent, leftSibling, thread;
  List<_RTTNode> children = [];
  double prelim = 0, modifier = 0;
  double? x, y; // Final positions
  _RTTNode(this.treeNode);
}

// Tree layout function
Map<TreeNode, Offset> tidyTreeLayout(TreeNode root) {
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

  _RTTNode findRightmostDescendant(_RTTNode node, int depth) {
    if (node.children.isEmpty) return node;
    return findRightmostDescendant(node.children.last, depth + 1);
  }

  _RTTNode findLeftmostDescendant(_RTTNode node, int depth) {
    if (node.children.isEmpty) return node;
    return findLeftmostDescendant(node.children.first, depth + 1);
  }

  double calculateNodePosition(_RTTNode node) {
    double position = node.prelim;
    _RTTNode? current = node;
    while (current != null && current != wrappedRoot) {
      position += current.modifier;
      current = current.parent;
    }
    return position;
  }

  void separateSubtrees(_RTTNode v, int depth) {
    if (v.children.length <= 1) return;

    for (int i = 1; i < v.children.length; i++) {
      var child = v.children[i];
      var leftSibling = v.children[i - 1];

      var rightmostOfLeft = findRightmostDescendant(leftSibling, depth + 1);
      var leftmostOfRight = findLeftmostDescendant(child, depth + 1);

      double leftPos = calculateNodePosition(rightmostOfLeft);
      double rightPos = calculateNodePosition(leftmostOfRight);

      if (leftPos + siblingSeparation + subtreeSeparation > rightPos) {
        double shift =
            leftPos + siblingSeparation + subtreeSeparation - rightPos;
        child.prelim += shift;
        child.modifier += shift;

        for (int k = i + 1; k < v.children.length; k++) {
          v.children[k].prelim += shift;
        }
      }
    }

    for (var child in v.children) {
      separateSubtrees(child, depth + 1);
    }
  }

  void firstWalk(_RTTNode v) {
    if (v.children.isEmpty) {
      v.prelim = (v.leftSibling != null)
          ? v.leftSibling!.prelim + siblingSeparation
          : 0;
    } else {
      for (var w in v.children) {
        firstWalk(w);
      }

      final firstChild = v.children.first;
      final lastChild = v.children.last;
      final mid = (firstChild.prelim + lastChild.prelim) / 2;

      v.prelim = mid;
    }

    if (v.children.isNotEmpty) {
      separateSubtrees(v, 0);
    }
  }

  void secondWalk(_RTTNode v, double m, int depth) {
    final x = v.prelim + m;
    final y = depth * levelSeparation;

    v.x = x;
    v.y = y;

    for (var c in v.children) {
      secondWalk(c, m + v.modifier, depth + 1);
    }
  }

  Map<TreeNode, Offset> result = {};
  firstWalk(wrappedRoot);
  separateSubtrees(wrappedRoot, 0);
  secondWalk(wrappedRoot, 0, 0);

  void extractPositions(_RTTNode v) {
    if (v.x != null && v.y != null) {
      result[v.treeNode] = Offset(v.x!, v.y!);
    }
    for (var c in v.children) {
      extractPositions(c);
    }
  }

  extractPositions(wrappedRoot);
  return result;
}
