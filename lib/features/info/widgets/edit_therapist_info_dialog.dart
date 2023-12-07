import 'package:emotion_station/components/components.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class EditTherapistInfoDialog extends StatefulWidget {
  const EditTherapistInfoDialog({
    super.key,
    required this.databaseRepository,
    required this.specialistId,
  });

  final IDatabaseRepository databaseRepository;
  final String specialistId;

  @override
  State<EditTherapistInfoDialog> createState() => _EditTherapistInfoDialogState();
}

class _EditTherapistInfoDialogState extends State<EditTherapistInfoDialog> {
  String _occupation = '';
  String _workplace = '';
  String _workHours = '';
  String _professionalPhoneNum = '';
  String _additionalEducation = '';

  Future<void> updateSpecialistInfo(
    String occupation,
    String workplace,
    String workHours,
    String professionalPhoneNum,
    String additionalEducation,
  ) async {
    final succ = await widget.databaseRepository.updateSpecialistInformation(
      specialistId: widget.specialistId,
      occupation: occupation,
      workplace: workplace,
      workHours: workHours,
      professionalPhoneNum: professionalPhoneNum,
      additionalEducation: additionalEducation,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                l10n.infoScreenEditTherapistInfoDialogMessage,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.infoScreenOccupation,
                onChanged: (occupation) {
                  setState(
                    () {
                      _occupation = occupation;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.infoScreenWorkplace,
                onChanged: (workplace) {
                  setState(
                    () {
                      _workplace = workplace;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.infoScreenWorkHours,
                onChanged: (workHours) {
                  setState(
                    () {
                      _workHours = workHours;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.infoScreenPhoneNumber,
                onChanged: (phoneNum) {
                  setState(
                    () {
                      _professionalPhoneNum = phoneNum;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ESTextInput(
                borderRadius: 16.0,
                height: 56.0,
                labelText: l10n.infoScreenAdditionalEducation,
                onChanged: (educiation) {
                  setState(
                    () {
                      _additionalEducation = educiation;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  //TODO add info to specialist
                  updateSpecialistInfo(
                    _occupation,
                    _workplace,
                    _workHours,
                    _professionalPhoneNum,
                    _additionalEducation,
                  );
                  context.pop();
                },
                child: Text(l10n.infoScreenEditInfo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
