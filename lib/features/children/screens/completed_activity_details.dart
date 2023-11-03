import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';

class CompletedActivityDetails extends StatelessWidget {
  const CompletedActivityDetails({super.key, required this.activityRecord});

  final ActivityRecord activityRecord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('This is activity details'),
            Text('Record: ${activityRecord.timeOfActivity.toString()}'),
          ],
        ),
      ),
    );
  }
}
