import 'package:flutter/material.dart';
import 'package:point_tracker_star_realms/settings/presentation/screen/settings_screen.dart';

void main() => runApp(MyPointer());

class MyPointer extends StatefulWidget {
  const MyPointer({Key? key}) : super(key: key);

  @override
  _MyPointerState createState() => _MyPointerState();
}

class _MyPointerState extends State<MyPointer> {
  //Блок 'Жизни'
  int _healthCount = 50;
  String _healthTitle = 'Жизни';

  //Блок 'Игроки'
  int _userCount = 2;
  String _userTitle = 'Игроки';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Realms Pointer',
      home: SettingsScreen(),
        //     Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //   // Expanded(
        //   //   child: UserListWidget(),
        //   // ),
        //   Row(children: [
        //     Expanded(
        //       child: StartCardWidget(
        //         value: _healthCount,
        //         title: _healthTitle,
        //         needProvider: false,
        //       ),
        //     ),
        //     Expanded(
        //       child: StartCardWidget(
        //         value: _userCount,
        //         title: _userTitle,
        //         needProvider: true,
        //       ),
        //     ),
        //   ]),
        //   Padding(
        //     padding: const EdgeInsets.all(4.0),
        //     child: ElevatedButton(
        //       onPressed: () {},
        //       child: Text('Начать игру'),
        //     ),
        //   ),
        // ]),
    );
  }
}
