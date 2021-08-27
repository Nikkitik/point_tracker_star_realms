import 'package:flutter/material.dart';

void main() => runApp(MyPointer());

class MyPointer extends StatefulWidget {
  const MyPointer({Key? key}) : super(key: key);

  @override
  _MyPointerState createState() => _MyPointerState();
}

class _MyPointerState extends State<MyPointer> {
  late List<String> _usersInfo = _getStartListUserInfo();

  int _health = 50;
  int _userCount = 2;

  bool _checkDecreaseButtonEnabled(int value) => value > 1;

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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Жизни',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '$_health',
                            style: TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: _checkDecreaseButtonEnabled(_health)
                                    ? () => _decreaseHealth()
                                    : null,
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () => _increaseHealth(),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Игроки',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '$_userCount',
                            style: TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed:
                                    _checkDecreaseButtonEnabled(_userCount)
                                        ? () => _decreaseUser()
                                        : null,
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () => _increaseUser(),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

  void _decreaseHealth() {
    setState(() {
      _health -= 1;
    });
  }

  void _increaseHealth() {
    setState(() {
      _health += 1;
    });
  }

  void _decreaseUser() {
    setState(() {
      _userCount -= 1;
      _usersInfo.removeAt(_userCount);
    });
  }

  void _increaseUser() {
    setState(() {
      _userCount += 1;
      _usersInfo.add('Введите имя $_userCount игрока');
    });
  }
}
