import 'package:point_tracker_star_realms/settings/domain/models/settings_element_info.dart';

class SettingsState {
  final List<SettingsElementInfo> elements;
  final int userCount;
  final int health;

  SettingsState({
    required this.elements,
    required this.userCount,
    required this.health,
  });

  SettingsState decreaseHealth() => _updateHealthToSettings(this.health - 1);

  SettingsState increaseHealth() => _updateHealthToSettings(this.health + 1);

  SettingsState _updateHealthToSettings(int newHealth) => SettingsState(
      elements: this
          .elements
          .map((element) => element.copyWithNewHealth(newHealth.toString()))
          .toList(),
      userCount: this.userCount,
      health: newHealth);

  SettingsState addNewElement() {
    this.elements.add(
          SettingsElementInfo(
            id: elements.length + 1,
            name: 'Введите имя ${elements.length + 1} игрока',
            health: this.health.toString(),
          ),
        );

    return SettingsState(
      elements: this.elements,
      userCount: this.elements.length,
      health: this.health,
    );
  }

  SettingsState removeElement() {
    this.elements.removeLast();

    return SettingsState(
      elements: this.elements,
      userCount: this.elements.length,
      health: this.health,
    );
  }
}
