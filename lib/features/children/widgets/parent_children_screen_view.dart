import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';

class ParentChildrenScreenView extends StatelessWidget {
  const ParentChildrenScreenView({super.key, required this.children});

  final List<Child>? children;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.amber,
          title: Text(
            children?[index].fullName ?? 'child name at index $index iz null',
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: children?.length ?? 0,
    );
  }
}
