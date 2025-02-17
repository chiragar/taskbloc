import 'package:hive/hive.dart';
import 'package:task/data/models/task_model.dart';

class TaskLocalDataSource {
  late final Box<TaskModel> taskBox;

  TaskLocalDataSource() {
    taskBox = Hive.box<TaskModel>('tasks');
  }
  void addTask(TaskModel task) => taskBox.put(task.id, task);
  void removeTask(String id) => taskBox.delete(id);
  void updateTask(TaskModel task) => taskBox.put(task.id, task);
  List<TaskModel> getTasks() => taskBox.values.toList();
}
