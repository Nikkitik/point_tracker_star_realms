import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_user_cubit.dart';
import 'package:point_tracker_star_realms/settings/presentation/widget/settings_user_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки игры'),
      ),
      body: BlocProvider(
        create: (_) => SettingsUserCubit(2),
        child: SettingsUserCard(),
      ),
    );
  }
}
