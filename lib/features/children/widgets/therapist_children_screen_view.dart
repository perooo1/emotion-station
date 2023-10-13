import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';

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
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: children?.length ?? 0,
    );
  }
}
