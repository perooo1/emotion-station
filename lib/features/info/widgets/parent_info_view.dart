import 'dart:math';

import 'package:common/common.dart';
import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class ParentInfoScreenView extends StatelessWidget {
  const ParentInfoScreenView({super.key, required this.parent});

  final Parent parent;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic);
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 75.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(Images.infoScreenHeroFirst),
              ),
            ),
            parent.specialistConnectionApproved == false
                ? Column(
                    children: [
                      const SizedBox(height: 36.0),
                      Center(
                        child: Text(
                          l10n.infoScreenTherapistNotConnectedMessage,
                          style: textStyle,
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [Text('ovo vidi kad je povezan s roditeljem')],
                  ),
          ],
        ),
      ),
    );
  }
}
