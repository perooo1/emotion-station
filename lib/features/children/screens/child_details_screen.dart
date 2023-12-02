import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/bloc/child_details_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class ChildDetailsScreen extends StatelessWidget {
  const ChildDetailsScreen({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildDetailsCubit>(
      create: (_) => GetIt.I.get<ChildDetailsCubit>(param1: child),
      child: const _ChildDetailsView(),
    );
  }
}

class _ChildDetailsView extends StatelessWidget {
  const _ChildDetailsView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lokal = Localizations.localeOf(context);

    final cubit = context.read<ChildDetailsCubit>();

    return BlocBuilder<ChildDetailsCubit, ChildDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(state.child.fullName), centerTitle: true),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  color: state.child.isGenderMale
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.child.fullName),
                        Text(state.child.diagnosis),
                        Text(state.child.age.toString()),
                        Text('parent id: ${state.child.parentId}'),
                      ],
                    ),
                  ),
                ),
              ),
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2022),
                startingDayOfWeek: StartingDayOfWeek.monday,
                lastDay: DateTime.now(),
                locale: '${lokal.languageCode}_${lokal.countryCode}',
                /*
                eventLoader: (day) {
          
          
                  final List<DateTime> matchingDates = state.outbursts
                      .where((date) =>
                          date.year == day.year && date.month == day.month && date.day == day.day)
                      .toList();
          
                  return matchingDates;
          
          
                  /*
                      final List<DateTime> evnt = [];
          
                      if (state.outbursts.contains(day)) {
                        evnt.add(day);
                      }
                      return evnt;
                      */
                },
          */
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    if (events.isNotEmpty) {
                      return Icon(Icons.celebration);
                    }
                    return null;
                  },
                ),
              ),

/*
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.pink,
                    title: Text(state.activityRecords?[index].timeOfActivity.toString() ?? 'null'),
                    onTap: () => context.goNamed(
                      EmotionStationRoutes.completedActivityDetails.routeName,
                      extra: ChildRouteData(
                        child: null,
                        activityRecord: state.activityRecords?[index],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemCount: state.activityRecords?.length ?? 0,
              ),
*/
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.mood),
            label: Text(l10n.childDetailsScreenAddEmotion),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AddEmotionDialog(
                selectedEmotion: state.selectedEmotion,
                childName: state.child.name,
                setForecastEmotion: (EmotionForecast emotion) =>
                    cubit.selectForecastEmotion(emotion),
                setForecastDate: (DateTime date) => cubit.selectForecastDate(date),
                setForecast: () => cubit.updateChildEmotionForecast(),
              ),
            ),
          ),
        );
      },
    );
  }
}
