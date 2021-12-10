import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_user_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_user_info.dart';

class SettingsUserCard extends StatelessWidget {
  SettingsUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsUserCubit, SettingsUserInfo>(
      builder: (context, userInfo) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userInfo.title,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  userInfo.count.toString(),
                  style: TextStyle(
                    fontSize: 150,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: userInfo.enabledDecreaseButton()
                          ? () => context
                              .read<SettingsUserCubit>()
                              .decreaseUserInfo()
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
                      onPressed: () =>
                          context.read<SettingsUserCubit>().increaseUserInfo(),
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
      },
    );
  }
}