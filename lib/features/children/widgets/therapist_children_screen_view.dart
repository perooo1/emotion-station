import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/widgets/widgets.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TherapistChildrenScreenView extends StatelessWidget {
  const TherapistChildrenScreenView({super.key, required this.children});

  final List<Child>? children;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return children?.length != 0
        ? ListView.separated(
            itemBuilder: (context, index) {
              return ChildCell(
                child: children?[index] ??
                    Child(
                      id: 'id',
                      parentId: 'fef',
                      name: 'name',
                      lastName: 'lastName',
                      age: 5,
                      isGenderMale: true,
                      diagnosis: 'diagnosis',
                      attendsKindergarten: false,
                      riskyPregnancy: false,
                      pregnancyBirthWeek: 22,
                      treatmentStartMonth: DateTime.now(),
                    ),
              );

/*
        return ListTile(
          tileColor: Colors.purple,
          title: Text(
            children?[index].fullName ?? 'THIS IS THERAPIST child name at index $index iz null',
          ),
          onTap: () => context.goNamed(
            EmotionStationRoutes.childDetailsScreen.routeName,
            extra: ChildRouteData(
              child: children?[index],
              activityRecord: null,
            ),
          ),
        );
*/
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: children?.length ?? 0,
          )
        : Center(
            child: Text(l10n.connectWithParentMessage),
          );
  }
}
