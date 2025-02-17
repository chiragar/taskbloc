import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/constant/app_colors.dart';
import 'package:task/core/extension/date_picker_extension.dart';
import 'package:task/data/models/task_model.dart';
import 'package:task/logic/task/task_bloc.dart';
import 'package:task/presentation/widget/list_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  late List<TaskModel> _tasks;
  late List<TaskModel> _pendingTasks;
  late List<TaskModel> _completedTasks;

  @override
  void initState() {
    super.initState();
    // Load tasks from the Bloc
    context.read<TaskBloc>().add(LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        actions: [
          InkWell(
              onTap: () {
                context.push('/All-task');
              },
              child: const Icon(Icons.all_inbox))
        ],
      ),
      body: Column(
        children: [
          // Date picker slider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: _selectedDate,
              onDateChange: (date) {
                setState(() {
                  _selectedDate = date;
                  // Filter tasks based on the selected date
                  _filterTasksByDate();
                });
              },
              selectionColor: AppColor.appBarColor,
              selectedTextColor: Colors.white,
              dayTextStyle: const TextStyle(color: Colors.black),
              monthTextStyle: const TextStyle(color: Colors.black),
              width: 60,
              height: 100,
            ),
          ),

          // Task list
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoaded) {
                  _tasks = state.tasks;
                  _filterTasksByDate();

                  return ListView(
                    children: [
                      _buildTaskList("Pending Tasks", _pendingTasks),
                      _buildTaskList("Completed Tasks", _completedTasks),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-task'),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _filterTasksByDate() {
    _pendingTasks = _tasks
        .where((task) =>
            task.date.isSameDateAs(_selectedDate) && !task.isCompleted)
        .toList();
    _completedTasks = _tasks
        .where(
            (task) => task.date.isSameDateAs(_selectedDate) && task.isCompleted)
        .toList();
  }

  Widget _buildTaskList(String title, List<TaskModel> tasks) {
    if (tasks.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return ListDataWidget(
                titleTxt: task.title,
                descriptionTxt: task.description,
                dateTxt: task.date,
                onEditTaps: () {
                  context.push('/update-task', extra: task);
                },
                onDeleteTaps: () {
                  context.read<TaskBloc>().add(RemoveTask(task.id));
                });
          },
        ),
      ],
    );
  }
}
