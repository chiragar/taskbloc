import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/data/repositories/task_repository.dart';
import 'package:task/data/source/local/task_local_data_source.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<TaskLocalDataSource>(() => TaskLocalDataSource());
  sl.registerLazySingleton<TaskRepository>(
      () => TaskRepository(sl<TaskLocalDataSource>()));
}
