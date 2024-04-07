import 'package:hive/hive.dart';

class DB {
  final _mybox = Hive.box('mybox');

  List todoList = [];

  //This isn't a built in function,it's a customize one
  void createInitData() {
    todoList = [
      ["Tap on the add icon to add a To-Do", false]
    ];
  }

  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put("TODOLIST", todoList);
  }
}
