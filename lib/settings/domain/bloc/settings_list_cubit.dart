import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsListCubit extends Cubit<List<String>> {
  SettingsListCubit() : super(_defaultListInfo);

  static final List<String> _defaultListInfo = <String>[
    'Введите имя 1 игрока',
    'Введите имя 2 игрока'
  ];

  void addNewUserInfo() {
    emit(List.from(state)..add('Введите имя ${state.length + 1} игрока'));
  }

  void removeLastUserInfo() {
    emit(List.from(state)..removeLast());
  }
}
