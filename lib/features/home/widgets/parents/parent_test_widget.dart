import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class ParentTestWidget extends StatelessWidget {
  const ParentTestWidget({super.key, required this.parent});

  final Parent parent;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.test_string_2),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.train,
                size: 75.0,
                color: Colors.amber,
              ),
              Text('tihs should only bee seen by parent'),
              Text('is current user parent? ${parent.isParent.toString()}'),
/*
              Text('This is a home widget when logged in'),
              Text('Current logged in user id: ${state.currentUser.id}'),
              Text('Current logged in user email: ${state.currentUser.email}'),
              Text('Current logged in full name: ${state.currentUser.fullName}'),
              Text(
                  'Current logged in user specialist from user obj? : ${state.currentUser.isSpecialist.toString()}'),
*/
            ],
          ),
        ),
      ),
    );
  }
}
