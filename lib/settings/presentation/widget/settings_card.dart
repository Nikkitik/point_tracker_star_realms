import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/models/SettingsInfo.dart';

class SettingsCard extends StatefulWidget {
  SettingsCard({
    Key? key,
    required this.title,
    required this.defaultCount,
    required this.settingsInfo,
  }) : super(key: key);

  final String title;
  final int defaultCount;
  final SettingsInfo settingsInfo;

  @override
  State<SettingsCard> createState() => _SettingsCardState(count: defaultCount);
}

class _SettingsCardState extends State<SettingsCard> {
  _SettingsCardState({required this.count});

  int count;

  bool _enabledDecreaseButton() => count > 1;

  void _decrease() {
    setState(() {
      count -= 1;
    });
  }

  void _increase() {
    setState(() {
      count += 1;
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
              widget.title,
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
                  onPressed: _enabledDecreaseButton()
                      ? () {
                          _decrease();

                          context
                              .read<SettingsCubit>()
                              .decrease(widget.settingsInfo);
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
                    _increase();

                    context.read<SettingsCubit>().increase(widget.settingsInfo);
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
