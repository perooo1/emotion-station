import 'package:emotion_station/components/components.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
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
  State<ConnectWithParentDialog> createState() => _ConnectWithParentDialogState();
}

class _ConnectWithParentDialogState extends State<ConnectWithParentDialog> {
  String _parentEmail = '';

  Future<void> connectTherapistToParent() async {
    final success = await widget.databaseRepository.connectSpecialistWithParent(
      parentEmail: _parentEmail,
      currentSpecialistId: widget.authenticationManager.getCurrentUser().id,
    );

    print(success);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.childrenScreenConnectWithParentDialogMessage,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ESTextInput(
              borderRadius: 16.0,
              height: 56.0,
              labelText: l10n.parentEmail,
              onChanged: (value) {
                setState(
                  () {
                    _parentEmail = value;
                  },
                );
              },
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: () {
                connectTherapistToParent();
                context.pop();
              },
              child: Text(l10n.connectWithParent),
            ),
          ],
        ),
      ),
    );
  }
}
