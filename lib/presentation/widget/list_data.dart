import 'package:flutter/material.dart';
import 'package:task/core/extension/date_only_extension.dart';

class ListDataWidget extends StatelessWidget {
  final String titleTxt;
  final String descriptionTxt;
  final DateTime dateTxt;
  final VoidCallback onEditTaps;
  final VoidCallback onDeleteTaps;

  const ListDataWidget(
      {super.key,
      required this.titleTxt,
      required this.descriptionTxt,
      required this.dateTxt,
      required this.onEditTaps,
      required this.onDeleteTaps});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFFF1F1F1), Color(0xFFF1F1F1)])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleTxt),
              Text(descriptionTxt),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit), onPressed: onEditTaps),
                  const SizedBox(width: 8),
                  IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDeleteTaps),
                ],
              ),
              Text(dateTxt.formattedDate),
            ],
          ),
        ],
      ),
    );
  }
}
