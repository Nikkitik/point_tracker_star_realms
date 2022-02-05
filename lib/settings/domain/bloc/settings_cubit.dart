import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_state.dart';
import 'package:point_tracker_star_realms/settings/domain/interfaces/settings_repository.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsCubit(this.settingsRepository)
      : super(settingsRepository.getStartState());

  void decreaseUserCount() {
    emit(state.removeElement());
  }

  void increaseUserCount() {
    emit(state.addNewElement());
  }

  void decreaseHealthCount() {
    emit(state.decreaseHealth());
  }

  void increaseHealthCount() {
    emit(state.increaseHealth());
  }
}
