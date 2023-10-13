import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/components/components.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';
import 'package:uuid/uuid.dart';

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
  String _name = '';
  String _lastName = '';
  int? _age;
  bool _isGenderMale = true;
  String _diagnosis = '';

  Future<void> createChildInDatabase() async {
    final parent = widget.authenticationManager.getCurrentUser() as Parent;

    final child = Child(
      id: const Uuid().v4(),
      parentId: widget.authenticationManager.getCurrentUser().id,
      assignedSpecialistId: parent.assignedSpecialistId,
      name: _name,
      lastName: _lastName,
      age: _age!,
      isGenderMale: _isGenderMale,
      diagnosis: _diagnosis,
    );

    final addChildSuccess = await widget.databaseRepository.createChildInDatabase(
      child: child,
      parentId: widget.authenticationManager.getCurrentUser().id,
    );
    print(addChildSuccess);

/*
    final parentRegisterSuccess = await databaseRepository.registerParent(parent: user);
      if (parentRegisterSuccess == true) {
        _currentUser = await databaseRepository.getParentFromDatabase(userId: user.id);
        return true;
      }
      return false;
*/
  }

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
                onChanged: (name) {
                  setState(() {
                    _name = name;
                  });
                },
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.children_screen_enter_child_last_name,
                onChanged: (lastName) {
                  setState(() {
                    _lastName = lastName;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(l10n.children_screen_enter_child_boy),
                      value: true,
                      groupValue: _isGenderMale,
                      onChanged: (value) => setState(
                        () => _isGenderMale = value!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text(l10n.children_screen_enter_child_girl),
                      value: false,
                      groupValue: _isGenderMale,
                      onChanged: (value) => setState(
                        () => _isGenderMale = value!,
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
                onChanged: (age) {
                  setState(() {
                    _age = int.parse(age);
                  });
                },
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.children_screen_enter_child_diagnosis,
                onChanged: (diagnosis) {
                  setState(() {
                    _diagnosis = diagnosis;
                  });
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  //Navigator.pop(context);
                  createChildInDatabase();
                  context.pop();
                },
                child: const Text('Add child'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
