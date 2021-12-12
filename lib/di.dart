import 'package:get_it/get_it.dart';
import 'package:point_tracker_star_realms/settings/data/impls/settings_repository_impl.dart';
import 'package:point_tracker_star_realms/settings/domain/interfaces/settings_repository.dart';

final GetIt locator = GetIt.instance;

configureDependencies() async {
  locator.registerFactory<SettingsRepository>(() => SettingsRepositoryImpl());
}
