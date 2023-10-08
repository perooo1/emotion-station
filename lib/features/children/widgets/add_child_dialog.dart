import 'package:emotion_station/components/components.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class AddChildDialog extends StatefulWidget {
  const AddChildDialog({
    super.key,
    required this.authenticationManager,
    required this.databaseRepository,
  });

  final IAuthenticationManager authenticationManager;
  final IDatabaseRepository databaseRepository;

  @override
  State<AddChildDialog> createState() => _AddChildDialogState();
}

class _AddChildDialogState extends State<AddChildDialog> {
  String name = '';
  String? lastName = '';
  int? age;
  bool isGenderMale = true;
  String diagnosis = '';

  Future<void> addToDatabase() async {}

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.children_screen_enter_child_info_message),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.children_screen_enter_child_name,
                onChanged: (p0) {},
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.children_screen_enter_child_last_name,
                onChanged: (p0) {},
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(l10n.children_screen_enter_child_boy),
                      value: true,
                      groupValue: isGenderMale,
                      onChanged: (value) => setState(
                        () => isGenderMale = value!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text(l10n.children_screen_enter_child_girl),
                      value: false,
                      groupValue: isGenderMale,
                      onChanged: (value) => setState(
                        () => isGenderMale = value!,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.children_screen_enter_child_age,
                onChanged: (p0) {},
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.children_screen_enter_child_diagnosis,
                onChanged: (p0) {},
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  //Navigator.pop(context);
                  context.pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
