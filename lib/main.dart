import 'package:flutter/material.dart';
import 'package:point_tracker_star_realms/widget/start_card.dart';

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
  late List<String> _usersInfo = _getStartListUserInfo();

  List<String> _getStartListUserInfo() {
    List<String> list = <String>[];

    for (int i = 0; i < _userCount; i++) {
      _addNewUser(i + 1);
    }

    return list;
  }

  void _addNewUser(int userNumber) =>
      _usersInfo.add('Введите имя ${userNumber.toString()} игрока');

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
              child: StartCardWidget(
                value: _healthCount,
                title: _healthTitle,
                onChangeValue: (int health) {
                  _healthCount = health;
                },
              ),
            ),
            Expanded(
              child: StartCardWidget(
                value: _userCount,
                title: _userTitle,
                onChangeValue: (int user) {
                  setState(() {
                    if (_userCount > user)
                      _usersInfo.removeAt(user);
                    else
                      _addNewUser(user);

                    _userCount = user;
                  });
                },
              ),
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
