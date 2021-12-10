import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_element_info.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_list_info.dart';

class SettingsListCubit extends Cubit<SettingsListInfo> {
  SettingsListCubit() : super(_defaultListInfo);

  static final SettingsListInfo _defaultListInfo = SettingsListInfo(
    items: [
      SettingsElementInfo(id: 1, name: 'Введите имя 1 игрока', health: '50'),
      SettingsElementInfo(id: 2, name: 'Введите имя 2 игрока', health: '50'),
    ],
  );

  String? health;
  List<SettingsElementInfo> currentListElementInfo = _defaultListInfo.items;

  void addNewUserInfo(int newCount) {
    currentListElementInfo.add(
      SettingsElementInfo(
          id: newCount,
          name: 'Введите имя $newCount игрока',
          health: health ?? '50'),
    );

    emit(state.updateListElementInfo(currentListElementInfo));
  }

  void removeLastUserInfo() {
    currentListElementInfo.removeLast();

    emit(state.updateListElementInfo(currentListElementInfo));
  }

  void changeHealthInfo(String newHealth) {
    health = newHealth;
    currentListElementInfo = state.setHealthToElementInfo(newHealth);

    emit(state.updateListElementInfo(currentListElementInfo));
  }
}
