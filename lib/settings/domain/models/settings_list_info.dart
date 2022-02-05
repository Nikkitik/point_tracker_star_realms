import 'package:point_tracker_star_realms/settings/domain/models/settings_element_info.dart';

class SettingsListInfo {
  List<SettingsElementInfo> items;

  SettingsListInfo({required this.items});

  List<SettingsElementInfo> setHealthToElementInfo(String newHealth) =>
      this.items.map((element) => element.copyWith(newHealth)).toList();

  SettingsListInfo updateListElementInfo(List<SettingsElementInfo> newListElementInfo) =>
      SettingsListInfo(items: newListElementInfo);
}
