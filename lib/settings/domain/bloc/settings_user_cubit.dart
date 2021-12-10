import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_list_cubit.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_user_info.dart';

class SettingsUserCubit extends Cubit<SettingsUserInfo> {
  final SettingsListCubit listCubit;

  SettingsUserCubit({required int userCount, required this.listCubit})
      : super(SettingsUserInfo(count: 2));

  void decreaseUserInfo() {
    int newCount = state.count - 1;
    emit(SettingsUserInfo(count: newCount));

    listCubit.removeLastUserInfo();
  }

  void increaseUserInfo() {
    int newCount = state.count + 1;
    emit(SettingsUserInfo(count: newCount));

    listCubit.addNewUserInfo(newCount);
  }
}
