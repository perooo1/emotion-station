import 'package:emotion_station/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class ConnectWithParentDialog extends StatefulWidget {
  const ConnectWithParentDialog({
    super.key,
    required this.authenticationManager,
    required this.databaseRepository,
  });

  final IAuthenticationManager authenticationManager;
  final IDatabaseRepository databaseRepository;

  @override
  State<ConnectWithParentDialog> createState() =>
      _ConnectWithParentDialogState();
}

class _ConnectWithParentDialogState extends State<ConnectWithParentDialog> {
  String _parentEmail = '';

  Future<void> connectTherapistToParent() async {
    final success = widget.databaseRepository.connectSpecialistWithParent(
        parentEmail: _parentEmail,
        currentSpecialistId: widget.authenticationManager.getCurrentUser().id);

    print(success);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ESTextInput(
              borderRadius: 16.0,
              height: 56.0,
              labelText: 'Parents email',
              onChanged: (value) {
                setState(
                  () {
                    _parentEmail = value;
                  },
                );
              },
            ),
            FilledButton(
              onPressed: () {
                connectTherapistToParent();
                context.pop();
              },
              child: const Text('Connect with parent'),
            ),
          ],
        ),
      ),
    );
  }
}
