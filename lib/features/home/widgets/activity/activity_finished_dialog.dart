import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityFinishedDialog extends StatelessWidget {
  const ActivityFinishedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Čestitam, daj mob mami ili tati'),
          FilledButton(
              onPressed: () {
                context.pop(); //pop dialog
                context.pop(); //pop activity
              },
              child: Text('Close activity')),
        ],
      ),
    );
  }
}
