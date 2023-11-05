import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TherapistChildrenScreenView extends StatelessWidget {
  const TherapistChildrenScreenView({super.key, required this.children});

  final List<Child>? children;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
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

/*
          onTap: () => context.goNamed(
            EmotionStationRoutes.childDetailsScreen.routeName,
            extra: children?[index],
          ),
*/
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: children?.length ?? 0,
    );
  }
}
