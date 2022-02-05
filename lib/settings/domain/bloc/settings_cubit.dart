import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_state.dart';
import 'package:point_tracker_star_realms/settings/domain/interfaces/settings_repository.dart';
import 'package:point_tracker_star_realms/settings/domain/models/SettingsInfo.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsCubit(this.settingsRepository)
      : super(settingsRepository.getStartState());

  void decrease(SettingsInfo settingsInfo) {
    switch (settingsInfo.runtimeType.toString()) {
      case "SettingsUserInfo":
        emit(state.removeElement());
        break;
      case "SettingsHealthInfo":
        emit(state.decreaseHealth());
        break;
    }
  }

  void increase(SettingsInfo settingsInfo) {
    switch (settingsInfo.runtimeType.toString()) {
      case "SettingsUserInfo":
        emit(state.addNewElement());
        break;
      case "SettingsHealthInfo":
        emit(state.increaseHealth());
        break;
    }
  }
}
