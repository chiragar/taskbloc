import 'package:task/data/models/task_model.dart';
import 'package:task/data/source/local/task_local_data_source.dart';

class TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepository(this.localDataSource);

  void addTask(TaskModel task) => localDataSource.addTask(task);
  void removeTask(String id) => localDataSource.removeTask(id);
  void updateTask(TaskModel task) => localDataSource.updateTask(task);
  List<TaskModel> getTasks() => localDataSource.getTasks();
}
