import 'package:flutter/material.dart';
import 'package:point_tracker_star_realms/widget/start_card.dart';

void main() => runApp(MyPointer());

class MyPointer extends StatefulWidget {
  const MyPointer({Key? key}) : super(key: key);

  @override
  _MyPointerState createState() => _MyPointerState();
}

class _MyPointerState extends State<MyPointer> {
  late List<String> _usersInfo = _getStartListUserInfo();

  int _userCount = 2;

  List<String> _getStartListUserInfo() {
    List<String> list = <String>[];

    for (int i = 0; i < _userCount; i++) {
      list.add('Введите имя ${(i + 1).toString()} игрока');
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Realms Pointer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Star Realms Pointer'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _usersInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    margin: EdgeInsets.all(2),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            _usersInfo[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Row(children: [
            Expanded(
              child: StartCardWidget(value: 50, title: 'Жизни'),
            ),
            Expanded(
              child: StartCardWidget(value: 2, title: 'Игроки'),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Начать игру'),
            ),
          ),
        ]),
      ),
    );
  }
}
