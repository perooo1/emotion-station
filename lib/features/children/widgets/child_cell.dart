import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/routes.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ChildCell extends StatelessWidget {
  const ChildCell({required this.child, super.key});

  final Child child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return GestureDetector(
      onTap: () => context.goNamed(
        EmotionStationRoutes.childDetailsScreen.routeName,
        extra: ChildRouteData(
          child: child,
          activityRecord: null,
        ),
      ),
      child: Card(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                child.fullName.capitalize(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(child.age.toString())),
                  Expanded(
                      child: Text(
                          '${l10n.childrenScreenEnterChildDiagnosis} ${child.diagnosis}')),
                  Expanded(
                    child: Text(
                      '${l10n.childrenScreenEnterChildPregnancyStartOfTreatment}: ${DateFormat('MM/yyyy').format(child.treatmentStartMonth ?? DateTime.now())}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
