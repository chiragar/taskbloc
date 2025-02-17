import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/extension/date_only_extension.dart';
import 'package:task/data/models/task_model.dart';
import 'package:task/logic/task/task_bloc.dart';
import 'package:uuid/uuid.dart';

class AddUpdateTaskPage extends StatefulWidget {
  final TaskModel? task;

  const AddUpdateTaskPage({Key? key, this.task}) : super(key: key);

  @override
  _AddUpdateTaskPageState createState() => _AddUpdateTaskPageState();
}

class _AddUpdateTaskPageState extends State<AddUpdateTaskPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
      _selectedDate = widget.task!.date;
      _isCompleted = widget.task!.isCompleted;
    }
  }

  void _saveTask() {
    final String title = _titleController.text.trim();
    final String description = _descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      return;
    }

    final task = TaskModel(
      id: widget.task?.id ?? const Uuid().v4(),
      title: title,
      description: description,
      date: _selectedDate,
      isCompleted: _isCompleted,
    );

    if (widget.task == null) {
      context.read<TaskBloc>().add(AddTask(task));
    } else {
      context.read<TaskBloc>().add(UpdateTask(task));
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Add Task' : 'Update Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: size.height * 0.02),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Text("Date: ${_selectedDate.toLocal().formattedDate}"),
                SizedBox(
                  width: size.width * 0.02,
                ),
                IconButton(
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != _selectedDate) {
                        setState(() {
                          _selectedDate = picked;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_today))
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Checkbox(
                  value: _isCompleted,
                  onChanged: (value) {
                    setState(() {
                      _isCompleted = value ?? false;
                    });
                  },
                ),
                const Text("Completed"),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveTask,
                child: Text(widget.task == null ? 'Add Task' : 'Update Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
