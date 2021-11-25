import 'package:flutter_bloc/flutter_bloc.dart';

class ListUserCubit extends Cubit<List<String>> {
  ListUserCubit() : super(_defaultUserList);

  static final List<String> _defaultUserList = <String>[
    'Введите имя 1 игрока',
    'Введите имя 2 игрока'
  ];

  void addUserInfo(int count) {
    emit(List.from(state)..add('Введите имя $count игрока'));
  }

  void removeUserInfo() {
    emit(List.from(state)..removeLast());
  }
}
