import 'package:common/common.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityFinishedDialog extends StatelessWidget {
  const ActivityFinishedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.activityFinishedHero),
        Text(l10n.activityFinishedDialogMessage),
        FilledButton(
          onPressed: () {
            context.pop(); //pop dialog
            context.pop(); //pop activity
          },
          child: Text(
            l10n.activityFinishedDialogButtonText,
          ),
        ),
      ],
    );
  }
}
