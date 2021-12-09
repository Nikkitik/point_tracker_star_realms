import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/util/counter_event.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListUserCubit, List<String>>(builder: (context, list) {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            margin: EdgeInsets.all(2),
            child: Center(
              child: Row(
                children: [
                  Text(
                    list[index],
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
