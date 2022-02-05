import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/di.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/interfaces/settings_repository.dart';
import 'package:point_tracker_star_realms/settings/presentation/widget/settings_health_card.dart';
import 'package:point_tracker_star_realms/settings/presentation/widget/settings_list.dart';
import 'package:point_tracker_star_realms/settings/presentation/widget/settings_user_card.dart';

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
        child: Column(
          children: [
            Expanded(child: SettingsList()),
            Row(
              children: [
                Expanded(child: SettingsHealthCard()),
                Expanded(child: SettingsUserCard()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
