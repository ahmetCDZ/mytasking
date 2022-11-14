import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function toggleStatus;

  ItemsCard(this.title, this.isDone, this.toggleStatus);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDone ? Colors.green.shade50 : Colors.white,
      elevation: isDone ? 1 : 5,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        textColor: Colors.black,
        title: Text(title),
        trailing: Checkbox(
          onChanged: toggleStatus(isDone),
          value: isDone,
          activeColor: Colors.black,
        ),
      ),
    );
  }
}
