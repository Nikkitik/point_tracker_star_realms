class UserInfo {
  int _userCount = 0;
  late List<String> _userList = _getStartUserList();

  UserInfo(int count) {
    this._userCount = count;
  }

  List<String> _getStartUserList() {
    List<String> list = <String>[];

    for (int i = 0; i < _userCount; i++) {
      list.add('Введите имя ${(i + 1).toString()} игрока');
    }

    this._userList = list;

    return list;
  }

  int get listLength => _userList.length;

  String getUserInfo(int index) => _userList[index];
}
