import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  int _userCount = 2;

  bool _checkDecreaseButtonEnabled(int value) => value > 1;

  void _decreaseUser() {
    setState(() {
      _userCount -= 1;
      //TODO: Добавить связь с виджетом списка
      //_usersInfo.removeAt(_userCount);
    });
  }

  void _increaseUser() {
    setState(() {
      _userCount += 1;
      //TODO: Добавить связь с виджетом списка
      //_usersInfo.add('Введите имя $_userCount игрока');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  onPressed: _checkDecreaseButtonEnabled(_userCount)
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
    );
  }
}
