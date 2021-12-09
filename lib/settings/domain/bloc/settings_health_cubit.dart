import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_health_info.dart';

class SettingsHealthCubit extends Cubit<SettingsHealthInfo> {
  SettingsHealthCubit(int healthCount) : super(SettingsHealthInfo(count: healthCount));

  void decreaseHealthInfo() {
    int newCount = state.count - 1;
    emit(SettingsHealthInfo(count: newCount));
  }

  void increaseHealthInfo() {
    int newCount = state.count + 1;
    emit(SettingsHealthInfo(count: newCount));
  }
}
