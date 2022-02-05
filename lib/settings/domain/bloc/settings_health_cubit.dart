import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_list_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_health_info.dart';

class SettingsHealthCubit extends Cubit<SettingsHealthInfo> {
  final SettingsListCubit listCubit;

  SettingsHealthCubit({required int healthCount, required this.listCubit})
      : super(SettingsHealthInfo(count: healthCount));

  void decreaseHealthInfo() {
    int newCount = state.count - 1;
    emit(SettingsHealthInfo(count: newCount));

    listCubit.changeHealthInfo(newCount.toString());
  }

  void increaseHealthInfo() {
    int newCount = state.count + 1;
    emit(SettingsHealthInfo(count: newCount));

    listCubit.changeHealthInfo(newCount.toString());
  }
}
