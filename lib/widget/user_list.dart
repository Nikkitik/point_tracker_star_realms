import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/util/counter_event.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  late List<String> _usersInfo = _getStartListUserInfo();

  List<String> _getStartListUserInfo() {
    List<String> list = <String>[];

    for (int i = 0; i < 2; i++) {
      list.add('Введите имя ${(i + 1).toString()} игрока');
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(builder: (context, count) {
      if (count < _usersInfo.length) {
        _usersInfo.removeAt(count);
      } else {
        _usersInfo.add('Введите имя ${count.toString()} игрока');
      }

      return ListView.builder(
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
        },
      );
    });
  }
}
