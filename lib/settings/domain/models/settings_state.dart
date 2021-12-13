import 'package:point_tracker_star_realms/settings/domain/models/settings_element_info.dart';

class SettingsState {
  final List<SettingsElementInfo> items;

  SettingsState({
    required this.items,
  });

  SettingsState setHealthToElementInfo(String newHealth) => SettingsState(
        items:
            this.items.map((element) => element.copyWith(newHealth)).toList(),
      );

  SettingsState addNewElement() {
    this.items.add(
          SettingsElementInfo(
            id: items.length + 1,
            name: 'Введите имя ${items.length + 1} игрока',
            health: items.first.health,
          ),
        );

    return SettingsState(items: this.items);
  }

  SettingsState removeElement() {
    this.items.removeLast();

    return SettingsState(items: this.items);
  }
}
