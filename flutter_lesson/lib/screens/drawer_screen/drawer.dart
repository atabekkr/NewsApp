import 'package:flutter/material.dart';
import 'package:flutter_lesson/screens/drawer_screen/drawer_body.dart';
import 'package:flutter_lesson/screens/drawer_screen/drawer_header.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [MyDrawerHeader(), MyDrawerBody()],
      ),
    );
  }
}
