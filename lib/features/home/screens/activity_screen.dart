import 'package:emotion_station/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({
    required this.activityTypeName,
    required this.childId,
    super.key,
  });

  final String activityTypeName;
  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('this is activity screen'),
            Text(' child id is: $childId'),
            Text(' activity type is: ${activityTypeName}'),
          ],
        ),
      ),
    );
  }
}
