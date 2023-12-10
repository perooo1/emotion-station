import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/bloc/child_details_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:repository/repository.dart';

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
    final cubit = context.read<ChildDetailsCubit>();

    return BlocBuilder<ChildDetailsCubit, ChildDetailsState>(
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(state.child.fullName.capitalize()),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: l10n.childDetailsScreenChildInfo,
                    icon: const Icon(Icons.child_care),
                  ),
                  Tab(
                    text: l10n.childDetailsScreenChildActivities,
                    icon: const Icon(Icons.analytics_outlined),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBarView(
                children: [
                  ChildInfoTab(child: state.child),
                  ChildActivitiesTab(activityRecords: state.activityRecords),
                ],
              ),
            ),
            floatingActionButton: cubit.authenticationManager.getCurrentUser().isParent
                ? FloatingActionButton.extended(
                    icon: const Icon(Icons.mood),
                    label: Text(l10n.childDetailsScreenAddEmotion),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AddEmotionDialog(
                        selectedEmotion: state.selectedEmotionAddDialog,
                        childName: state.child.name,
                        setForecastEmotion: (EmotionForecast emotion) =>
                            cubit.selectForecastEmotionAddDialog(emotion),
                        setForecastDate: (DateTime date) => cubit.selectForecastDateAddDialog(date),
                        setForecast: () => cubit.updateChildEmotionForecast(),
                      ),
                    ),
                  )
                : FloatingActionButton.extended(
                    icon: const Icon(Icons.edit),
                    label: Text(l10n.addNoteString),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AddNoteTherapistDialog(
                        childId: state.child.id,
                        databaseRepository: Injector.locateService<IDatabaseRepository>(),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
