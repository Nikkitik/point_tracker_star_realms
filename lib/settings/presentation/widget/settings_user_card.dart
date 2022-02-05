import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_state.dart';

class SettingsUserCard extends StatelessWidget {
  SettingsUserCard({Key? key}) : super(key: key);

  bool enabledDecreaseButton(int count) => count > 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
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
                  state.items.length.toString(),
                  style: TextStyle(
                    fontSize: 150,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: enabledDecreaseButton(state.items.length)
                          ? () => context.read<SettingsCubit>().decrease()
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
                      onPressed: () => context.read<SettingsCubit>().increase(),
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
