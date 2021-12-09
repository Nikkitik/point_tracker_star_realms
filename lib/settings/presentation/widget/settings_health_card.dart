import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_health_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_health_info.dart';

class SettingsHealthCard extends StatelessWidget {
  SettingsHealthCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsHealthCubit, SettingsHealthInfo>(
      builder: (context, healthInfo) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  healthInfo.title,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  healthInfo.count.toString(),
                  style: TextStyle(
                    fontSize: 150,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: healthInfo.enabledDecreaseButton()
                          ? () => context
                              .read<SettingsHealthCubit>()
                              .decreaseHealthInfo()
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
                      onPressed: () => context
                          .read<SettingsHealthCubit>()
                          .increaseHealthInfo(),
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
