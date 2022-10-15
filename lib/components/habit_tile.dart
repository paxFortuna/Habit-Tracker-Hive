import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile({
    Key? key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChanged,
    required this.settingsTapped,
    required this.deleteTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 8, right: 24, bottom: 12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            //settings option
            SlidableAction(
              onPressed: settingsTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              label: '수정',
              borderRadius: BorderRadius.circular(12),
            ),
            // delete option
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red.shade300,
              icon: Icons.delete,
              label: '삭제',
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        // startActionPane:,
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
          decoration: BoxDecoration(
            color: habitCompleted? Colors.yellow : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: habitCompleted,
                onChanged: onChanged,
              ),
              // habit name
              Expanded(
                child: Text(
                  habitName,
                  softWrap: true,
                  maxLines: 10,
                  overflow: TextOverflow.clip,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
