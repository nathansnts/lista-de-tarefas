import 'dart:convert';
import 'package:lista_tarefas/models/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {
  TaskRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  void saveTasks(List<Tasks> task) {
    final jsonString = json.encode(task);
    print(jsonString);
  }
}
