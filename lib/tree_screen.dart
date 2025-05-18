import 'package:aatma/edge_widget.dart';
import 'package:aatma/goal_widget.dart';
import 'package:aatma/graph_view.dart';
import 'package:aatma/treenode.dart';
import 'package:flutter/material.dart';

class TreeScreen extends StatefulWidget {
  const TreeScreen({super.key});

  @override
  State<TreeScreen> createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  TreeNode node1 = TreeNode();
  TreeNode node2 = TreeNode();
  TreeNode node3 = TreeNode();
  TreeNode node4 = TreeNode();
  TreeNode node5 = TreeNode();
  TreeNode node6 = TreeNode();
  TreeNode node7 = TreeNode();
  TreeNode node8 = TreeNode();

  @override
  void initState() {
    super.initState();
    node1.addChildren([node2, node3]);
    node3.addChildren([node4, node5]);
    node2.addChild(node6);
    node2.addChild(node7);
    // node2.addChild(node7);
    node7.addChild(node8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GraphView(root: node1),
      // backgroundColor: Colors.black,
    );
  }
}
