import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/interfaces/settings_repository.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsCubit(this.settingsRepository)
      : super(settingsRepository.getStartState());

  void decrease() {
    emit(state.removeElement());
  }

  void increase() {
    emit(state.addNewElement());
  }

  void changeHealthInfo(String newHealth) {
    emit(state.setHealthToElementInfo(newHealth));
  }
}
