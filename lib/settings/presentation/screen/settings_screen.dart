import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/di.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_state.dart';
import 'package:point_tracker_star_realms/settings/domain/interfaces/settings_repository.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_info.dart';
import 'package:point_tracker_star_realms/settings/presentation/widget/settings_card.dart';
import 'package:point_tracker_star_realms/settings/presentation/widget/settings_list.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки игры'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SettingsCubit(locator.get<SettingsRepository>()),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SettingsList(elementsInfo: state.elements),
              ),
              Row(
                children: [
                  Expanded(
                    child: SettingsCard(
                      title: 'Жизни',
                      count: state.health,
                      settingsInfo: SettingsHealthInfo(),
                    ),
                  ),
                  Expanded(
                    child: SettingsCard(
                      title: 'Игроки',
                      count: state.userCount,
                      settingsInfo: SettingsUserInfo(),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
