

import 'package:point_tracker_star_realms/settings/domain/models/settings_state.dart';

abstract class SettingsRepository {
  SettingsState getStartState();
}
