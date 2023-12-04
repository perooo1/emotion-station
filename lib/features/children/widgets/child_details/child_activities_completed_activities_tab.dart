import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/navigation/routes.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChildActivitiesCompletedActivitesTab extends StatelessWidget {
  const ChildActivitiesCompletedActivitesTab({required this.activityRecords, super.key});

  final List<ActivityRecord>? activityRecords;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.pink,
          title: Text(activityRecords?[index].timeOfActivity.toString() ?? 'null'),
          onTap: () => context.goNamed(
            EmotionStationRoutes.completedActivityDetails.routeName,
            extra: ChildRouteData(
              child: null,
              activityRecord: activityRecords?[index],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: activityRecords?.length ?? 0,
    );
  }
}
