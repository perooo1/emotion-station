import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/routes.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ChildActivitiesCompletedActivitesTab extends StatelessWidget {
  const ChildActivitiesCompletedActivitesTab({required this.activityRecords, super.key});

  final List<ActivityRecord>? activityRecords;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView.separated(
      padding: EdgeInsets.only(
        top: 16.0,
        bottom: 75.0,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          child: ListTile(
            subtitle: Text(DateFormat('dd/MM/yyyy')
                .format(activityRecords?[index].timeOfActivity ?? DateTime.now())),
            title: Text(
              activityRecords?[index].emotionStation.activityType == ActivityType.stationOfHappiness
                  ? l10n.stationOfHappiness
                  : activityRecords?[index].emotionStation.activityType ==
                          ActivityType.stationOfSadness
                      ? l10n.stationOfSadness
                      : activityRecords?[index].emotionStation.activityType ==
                              ActivityType.stationOfFear
                          ? l10n.stationOfFear
                          : l10n.stationOfAnger,
            ),
            onTap: () => context.goNamed(
              EmotionStationRoutes.completedActivityDetails.routeName,
              extra: ChildRouteData(
                child: null,
                activityRecord: activityRecords?[index],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: activityRecords?.length ?? 0,
    );
  }
}
