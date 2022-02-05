class SettingsElementInfo {
  SettingsElementInfo({
    required this.id,
    required this.name,
    required this.health,
  }) : super();

  final int id;
  final String name;
  final String health;

  SettingsElementInfo copyWithNewHealth(String newHealth) =>
      SettingsElementInfo(id: this.id, name: this.name, health: newHealth);
}
