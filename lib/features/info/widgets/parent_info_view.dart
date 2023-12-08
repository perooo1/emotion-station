import 'package:common/common.dart';
import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ParentInfoScreenView extends StatelessWidget {
  const ParentInfoScreenView({
    required this.parent,
    required this.specialist,
    super.key,
  });

  final Parent parent;
  final Specialist specialist;

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
            parent.specialistConnectionApproved == false || specialist.id.isEmpty
                ? Column(
                    children: [
                      const SizedBox(height: 36.0),
                      Center(
                        child: Text(
                          l10n.infoScreenTherapistNotConnectedMessage,
                          style: textStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      specialist.fullName != null
                          ? Text(
                              specialist.fullName!.capitalize(),
                              style: textStyle.copyWith(fontSize: 28.0),
                            )
                          : Text(
                              specialist.fullName ?? l10n.unknownString,
                              style: textStyle.copyWith(fontSize: 28.0),
                            ),
                      const SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${l10n.infoScreenOccupation}:',
                              style: textStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              specialist.occupation ?? l10n.unknownString,
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${l10n.infoScreenWorkplace}:',
                              style: textStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              specialist.workAddress ?? l10n.unknownString,
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${l10n.infoScreenWorkHours}:',
                              style: textStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              specialist.workHours ?? l10n.unknownString,
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              l10n.infoScreenPhoneNumber,
                              style: textStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              specialist.professionalPhoneNum ?? l10n.unknownString,
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${l10n.infoScreenAdditionalEducation}:',
                              style: textStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              specialist.additionalEducation ?? l10n.unknownString,
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
