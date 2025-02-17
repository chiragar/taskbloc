import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/core/di/service_locator.dart';
import 'package:task/data/models/task_model.dart';
import 'package:task/data/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository = sl<TaskRepository>();

  TaskBloc() : super(TaskInitial()) {
    on<LoadTasks>((event, emit) {
      final tasks = repository.getTasks();
      emit(TaskLoaded(tasks));
    });

    on<AddTask>((event, emit) {
      repository.addTask(event.task);
      add(LoadTasks());
    });

    on<RemoveTask>((event, emit) {
      repository.removeTask(event.taskId);
      add(LoadTasks());
    });

    on<UpdateTask>((event, emit) {
      repository.updateTask(event.task);
      add(LoadTasks());
    });
  }
}
