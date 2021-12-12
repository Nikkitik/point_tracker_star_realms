import 'package:point_tracker_star_realms/settings/domain/interfaces/settings_repository.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_element_info.dart';
import 'package:point_tracker_star_realms/settings/domain/models/settings_state.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  int count = 2;
  int health = 50;
  String title = 'Игроки';
  List<SettingsElementInfo> items = [];

  @override
  SettingsState getStartState() {
    for (int i = 0; i < count; i++) {
      items.add(
        SettingsElementInfo(
          id: i,
          name: 'Введите имя ${i + 1} игрока',
          health: health.toString(),
        ),
      );
    }

    return SettingsState(
      health: this.health.toString(),
      items: this.items,
    );
  }
}
