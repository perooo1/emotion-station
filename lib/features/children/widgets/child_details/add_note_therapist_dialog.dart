import 'package:emotion_station/components/es_text_input.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class AddNoteTherapistDialog extends StatefulWidget {
  const AddNoteTherapistDialog({
    super.key,
    required this.databaseRepository,
    required this.childId,
  });

  final IDatabaseRepository databaseRepository;
  final String childId;

  @override
  State<AddNoteTherapistDialog> createState() => _AddNoteTherapistDialogState();
}

class _AddNoteTherapistDialogState extends State<AddNoteTherapistDialog> {
  String _specialistNote = '';

  Future<void> addNote() async {
    final a = await widget.databaseRepository.addSpecialistNote(
      childId: widget.childId,
      specialistNote: _specialistNote,
    );
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
              l10n.childDetailsScreenTherapistNoteDialogMessage,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            ESTextInput(
              borderRadius: 16.0,
              height: 56.0,
              labelText: l10n.addNoteString,
              onChanged: (note) {
                setState(() {
                  _specialistNote = note;
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
