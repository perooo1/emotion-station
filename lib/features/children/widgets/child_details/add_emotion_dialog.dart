import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class AddEmotionDialog extends StatefulWidget {
  const AddEmotionDialog({
    super.key,
    required this.selectedEmotion,
    required this.childName,
    required this.setForecastEmotion,
    required this.setForecastDate,
    required this.setForecast,
  });

  final EmotionForecast selectedEmotion;
  final String childName;
  final Function(EmotionForecast) setForecastEmotion;
  final Function(DateTime) setForecastDate;
  final VoidCallback setForecast;

  @override
  State<AddEmotionDialog> createState() => _AddEmotionDialogState();
}

class _AddEmotionDialogState extends State<AddEmotionDialog> {
  late EmotionForecast currentState = widget.selectedEmotion;

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                l10n.emotionForecastAddEmotionDialogMessage,
                style: const TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
            TableCalendar(
              headerStyle: const HeaderStyle(
                  titleCentered: true, formatButtonVisible: false),
              focusedDay: today,
              startingDayOfWeek: StartingDayOfWeek.monday,
              firstDay: DateTime(2022),
              lastDay: DateTime.now(),
              onDaySelected: (selectedDay, focusedDay) =>
                  _onDaySelected(selectedDay, focusedDay),
              selectedDayPredicate: (day) => isSameDay(day, today),
            ),
            ChoiceChip(
              showCheckmark: false,
              avatar: currentState == EmotionForecast.sad
                  ? Icon(
                      Icons.cloudy_snowing,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white
                          : null,
                    )
                  : Icon(
                      Icons.cloud_outlined,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white
                          : null,
                    ),
              label: Text(l10n.emotionForecastSad),
              selected: currentState == EmotionForecast.sad,
              onSelected: (_) {
                widget.setForecastEmotion(EmotionForecast.sad);
                setState(
                  () {
                    currentState = EmotionForecast.sad;
                  },
                );
              },
            ),
            ChoiceChip(
              showCheckmark: false,
              avatar: currentState == EmotionForecast.happy
                  ? Icon(
                      Icons.sunny,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white
                          : null,
                    )
                  : Icon(
                      Icons.wb_sunny_outlined,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white
                          : null,
                    ),
              label: Text(l10n.emotionForecastHappy),
              selected: currentState == EmotionForecast.happy,
              onSelected: (_) {
                widget.setForecastEmotion(EmotionForecast.happy);
                setState(
                  () {
                    currentState = EmotionForecast.happy;
                  },
                );
              },
            ),
            ChoiceChip(
              showCheckmark: false,
              avatar: currentState == EmotionForecast.angry
                  ? Icon(
                      Icons.thunderstorm,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white
                          : null,
                    )
                  : Icon(
                      Icons.thunderstorm_outlined,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white
                          : null,
                    ),
              label: Text(l10n.emotionForecastAngry),
              selected: currentState == EmotionForecast.angry,
              onSelected: (_) {
                widget.setForecastEmotion(EmotionForecast.angry);
                setState(
                  () {
                    currentState = EmotionForecast.angry;
                  },
                );
              },
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              child: Text(l10n.childDetailsScreenAddEmotion),
              onPressed: () {
                widget.setForecastDate(today);
                widget.setForecast();
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(
      () {
        today = day;
      },
    );
  }
}
