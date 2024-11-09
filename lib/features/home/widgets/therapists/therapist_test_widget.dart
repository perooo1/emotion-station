import 'package:common/common.dart';
import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/widgets/widgets.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class TherapistTestWidget extends StatelessWidget {
  const TherapistTestWidget({super.key, required this.specialist});

  final Specialist specialist;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(l10n.emotionStation),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  height: 200,
                  width: 200,
                  Images.homeScreenHero,
                ),
                const SizedBox(height: 16.0),
                StationStartButton(
                  fillColor: Colors.yellow.shade100,
                  borderColor: Colors.yellow,
                  borderRadius: 12,
                  title: l10n.stationOfHappiness,
                  onAction: () {},
                ),
                const SizedBox(height: 16.0),
                StationStartButton(
                  fillColor: Theme.of(context).colorScheme.secondaryContainer,
                  borderColor: Theme.of(context).colorScheme.secondary,
                  borderRadius: 12,
                  title: l10n.stationOfSadness,
                  onAction: () {},
                ),
                const SizedBox(height: 16.0),
                StationStartButton(
                  fillColor: Theme.of(context).colorScheme.tertiaryContainer,
                  borderColor: Theme.of(context).colorScheme.tertiary,
                  borderRadius: 12,
                  title: l10n.stationOfFear,
                  onAction: () {},
                ),
                const SizedBox(height: 16.0),
                StationStartButton(
                  fillColor: Theme.of(context).colorScheme.errorContainer,
                  borderColor: Theme.of(context).colorScheme.error,
                  borderRadius: 12,
                  title: l10n.stationOfAnger,
                  onAction: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
