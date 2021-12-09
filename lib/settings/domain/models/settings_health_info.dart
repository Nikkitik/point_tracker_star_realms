class SettingsHealthInfo {
  SettingsHealthInfo({required this.count}) : super();

  final int count;
  final String title = 'Жизни';

  bool enabledDecreaseButton() => count > 1;
}