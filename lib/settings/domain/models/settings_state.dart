import 'package:point_tracker_star_realms/settings/domain/models/settings_element_info.dart';

class SettingsState {
  final String health;
  final List<SettingsElementInfo> items;

  SettingsState({
    required this.health,
    required this.items,
  });

  SettingsState setHealthToElementInfo(String newHealth) => SettingsState(
        health: newHealth,
        items:
            this.items.map((element) => element.copyWith(newHealth)).toList(),
      );

  SettingsState addNewElement() {
    this.items.add(
          SettingsElementInfo(
            id: items.length + 1,
            name: 'Введите имя ${items.length + 1} игрока',
            health: this.health,
          ),
        );

    return SettingsState(
      health: this.health,
      items: this.items,
    );
  }

  SettingsState removeElement() {
    this.items.removeLast();

    return SettingsState(
      health: this.health,
      items: this.items,
    );
  }
}
