import 'package:flutter/material.dart';
import 'package:point_tracker_star_realms/settings/presentation/screen/settings_screen.dart';

void main() => runApp(MyPointer());

class MyPointer extends StatefulWidget {
  const MyPointer({Key? key}) : super(key: key);

  @override
  _MyPointerState createState() => _MyPointerState();
}

class _MyPointerState extends State<MyPointer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Realms Pointer',
      home: SettingsScreen(),
    );
  }
}
