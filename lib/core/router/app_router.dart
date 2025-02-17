import 'package:go_router/go_router.dart';
import 'package:task/data/models/task_model.dart';
import 'package:task/presentation/pages/add_update_task_page.dart';
import 'package:task/presentation/pages/home_page.dart';
import 'package:task/presentation/pages/previous_record.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/add-task',
      builder: (context, state) => AddUpdateTaskPage(),
    ),
    GoRoute(
      path: '/update-task',
      builder: (context, state) {
        final task = state.extra as TaskModel;
        return AddUpdateTaskPage(task: task);
      },
    ),
    GoRoute(
      path: '/All-task',
      builder: (context, state) {
        return const AllRecordPage();
      },
    ),
  ],
);
