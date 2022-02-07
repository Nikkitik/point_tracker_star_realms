import 'package:flutter/material.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_info.dart';
import 'package:provider/src/provider.dart';

class SettingsCard extends StatelessWidget {
  SettingsCard({
    Key? key,
    required this.title,
    required this.count,
    required this.settingsInfo,
  }) : super(key: key);

  final String title;
  final int count;
  final SettingsInfo settingsInfo;

  bool _enabledButtonDecrease(int count) => count > 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 150,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _enabledButtonDecrease(count)
                      ? () {
                          context.read<SettingsCubit>().decrease(settingsInfo);
                        }
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
                  onPressed: () {
                    context.read<SettingsCubit>().increase(settingsInfo);
                  },
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
