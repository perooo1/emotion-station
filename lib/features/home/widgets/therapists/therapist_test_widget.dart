import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';

class TherapistTestWidget extends StatelessWidget {
  const TherapistTestWidget({super.key, required this.specialist});

  final Specialist specialist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // specialist nema app bar!
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.supervisor_account,
                size: 75.0,
                color: Colors.purple,
              ),
              Text('tihs should only bee seen by specialist'),
              Text('is current user specialist? ${specialist.isSpecialist.toString()}'),
              OutlinedButton(
                onPressed: () {},
                child: Text('random button'),
              ),
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
