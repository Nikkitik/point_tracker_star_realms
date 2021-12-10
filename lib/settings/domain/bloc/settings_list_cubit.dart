import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_tracker_star_realms/settings/domain/bloc/settings_user_cubit.dart';

class SettingsListCubit extends Cubit<List<String>> {
  final SettingsUserCubit userCubit;

  StreamSubscription? _userCubitStreamSubscription;

  static final List<String> _defaultListInfo = <String>[
    'Введите имя 1 игрока',
    'Введите имя 2 игрока'
  ];

  SettingsListCubit({required this.userCubit}) : super(_defaultListInfo) {
    _userCubitStreamSubscription = userCubit.stream.distinct((prev, next) {
      return prev.count == next.count;
    }).listen((state) {
      updateListInfo(state.count);
    });
  }

  void updateListInfo(int newCount) {
    if (newCount > state.length) {
      emit(List.from(state)..add('Введите имя $newCount игрока'));
    } else {
      emit(List.from(state)..removeLast());
    }
  }

  @override
  Future<void> close() {
    _userCubitStreamSubscription?.cancel();
    return super.close();
  }
}
