class SettingsUserInfo {
  SettingsUserInfo({required this.count}) : super();

  final int count;
  final String title = 'Игроки';

  bool enabledDecreaseButton() => count > 1;
}