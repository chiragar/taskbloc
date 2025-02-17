part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final TaskModel task;
  AddTask(this.task);

  @override
  List<Object?> get props => [task];
}

class RemoveTask extends TaskEvent {
  final String taskId;
  RemoveTask(this.taskId);

  @override
  List<Object?> get props => [taskId];
}

class UpdateTask extends TaskEvent {
  final TaskModel task;
  UpdateTask(this.task);

  @override
  List<Object?> get props => [task];
}
