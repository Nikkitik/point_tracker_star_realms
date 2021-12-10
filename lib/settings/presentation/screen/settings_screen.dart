import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_health_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_list_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_user_cubit.dart';
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
            create: (_) => SettingsUserCubit(2),
          ),
          BlocProvider(
            create: (_) => SettingsHealthCubit(50),
          ),
          BlocProvider(
            create: (context) => SettingsListCubit(
              userCubit: context.read<SettingsUserCubit>(),
            ),
          )
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
