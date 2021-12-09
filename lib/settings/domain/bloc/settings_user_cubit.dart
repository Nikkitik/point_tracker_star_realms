import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_user_info.dart';

class SettingsUserCubit extends Cubit<SettingsUserInfo> {
  SettingsUserCubit(int userCount) : super(SettingsUserInfo(count: userCount));

  void decreaseUserInfo() {
    int newCount = state.count - 1;
    emit(SettingsUserInfo(count: newCount));
  }

  void increaseUserInfo() {
    int newCount = state.count + 1;
    emit(SettingsUserInfo(count: newCount));
  }
}
