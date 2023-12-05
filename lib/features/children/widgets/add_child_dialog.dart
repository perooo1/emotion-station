import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/components/components.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
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
  bool _attendsKindergarten = false;
  bool _riskyPregnancy = false;
  int? _pregnancyBirthWeek;
  DateTime _treatmentStartMonth = DateTime.now();

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
      attendsKindergarten: _attendsKindergarten,
      riskyPregnancy: _riskyPregnancy,
      pregnancyBirthWeek: _pregnancyBirthWeek!,
      treatmentStartMonth: _treatmentStartMonth,
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
              Text(
                l10n.childrenScreenEnterChildInfoMessage,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.childrenScreenEnterChildName,
                onChanged: (name) {
                  setState(
                    () {
                      _name = name;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.childrenScreenEnterChildLast_name,
                onChanged: (lastName) {
                  setState(
                    () {
                      _lastName = lastName;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(l10n.childrenScreenEnterChildBoy),
                      value: true,
                      groupValue: _isGenderMale,
                      onChanged: (value) => setState(
                        () => _isGenderMale = value!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text(l10n.childrenScreenEnterChildGirl),
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
                labelText: l10n.childrenScreenEnterChildAge,
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
                labelText: l10n.childrenScreenEnterChildDiagnosis,
                onChanged: (diagnosis) {
                  setState(() {
                    _diagnosis = diagnosis;
                  });
                },
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.childrenScreenEnterChildPregnancyBirthWeek,
                onChanged: (week) {
                  setState(() {
                    _pregnancyBirthWeek = int.parse(week);
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text(l10n.childrenScreenEnterChildPregnancyTreatmentStartMonth),
                    onPressed: () => showMonthPicker(
                      context: context,
                      lastDate: DateTime.now(),
                      roundedCornersRadius: 27.0,
                    ).then(
                      (value) {
                        if (value != null) {
                          setState(
                            () {
                              _treatmentStartMonth = DateTime(value.year, value.month);
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${l10n.childrenScreenEnterChildPregnancyStartOfTreatment}: ${DateFormat('MM/yyyy').format(_treatmentStartMonth)}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Attends kindergarten?'),
                  Switch(
                    value: _attendsKindergarten,
                    onChanged: (value) => setState(() => _attendsKindergarten = value),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Risky pregnancy?'),
                  Switch(
                    value: _riskyPregnancy,
                    onChanged: (value) => setState(() => _riskyPregnancy = value),
                  )
                ],
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
