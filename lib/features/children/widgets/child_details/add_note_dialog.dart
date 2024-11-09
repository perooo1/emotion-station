import 'package:emotion_station/components/es_text_input.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class AddNoteDialog extends StatefulWidget {
  const AddNoteDialog({
    super.key,
    required this.databaseRepository,
    required this.childId,
    this.isActivityDetails = false,
    this.isParentNote = false,
    this.activityRecordId,
  });

  final IDatabaseRepository databaseRepository;
  final String childId;
  final bool isActivityDetails;
  final bool isParentNote;
  final String? activityRecordId;

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  String _note = '';

  Future<void> addNote() async {
    if (widget.isActivityDetails == true && widget.isParentNote == true) {
      await widget.databaseRepository.addParentNoteActivityRecord(
        activityRecordId: widget.activityRecordId!,
        parentNote: _note,
      );
    } else if (widget.isActivityDetails == true &&
        widget.isParentNote == false) {
      await widget.databaseRepository.addSpecialistNoteActivityRecord(
        activityRecordId: widget.activityRecordId!,
        specialistNote: _note,
      );
    } else {
      await widget.databaseRepository.addSpecialistNoteChild(
        childId: widget.childId,
        specialistNote: _note,
      );
    }
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
              widget.isActivityDetails
                  ? widget.isParentNote
                      ? l10n
                          .childDetailsScreenParentAddNoteDialogMessageActivityRecord
                      : l10n
                          .childDetailsScreenTherapistAddNoteDialogMessageActivityRecord
                  : l10n.childDetailsScreenTherapistNoteDialogMessage,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            ESTextInput(
              borderRadius: 16.0,
              height: 56.0,
              labelText: l10n.addNoteString,
              onChanged: (note) {
                setState(() {
                  _note = note;
                });
              },
            ),
            const SizedBox(height: 16),
            FilledButton(
              child: Text(l10n.addNoteString),
              onPressed: () {
                addNote();
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
