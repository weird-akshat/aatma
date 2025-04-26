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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    node1.addChildren([node2, node3]);
    node3.addChild(node4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GraphView(root: node1));
  }
}
