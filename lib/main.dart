import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/di/service_locator.dart';
import 'package:task/core/router/app_router.dart';
import 'package:task/core/theme/themes.dart';
import 'package:task/data/models/task_model.dart';
import 'package:task/logic/task/task_bloc.dart';

Future<void> main() async {
  // Ensure that Flutter binding is initialized before opening the box
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter()); // Register the TaskModel adapter
  await Hive.openBox<TaskModel>('tasks'); // Open the box

  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc()..add(LoadTasks()),
      child: MaterialApp.router(
        theme: Themes.light,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }

  @override
  void dispose() {
    // Close Hive when the app is disposed
    Hive.close();
    super.dispose();
  }
}
