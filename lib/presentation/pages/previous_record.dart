import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task/logic/task/task_bloc.dart';
import 'package:task/presentation/widget/list_data.dart';

class AllRecordPage extends StatelessWidget {
  const AllRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Record Task List')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
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
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
