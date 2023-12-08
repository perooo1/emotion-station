// Flutter imports:
import 'package:common/common.dart';
import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/info/bloc/info_screen_cubit.dart';
import 'package:emotion_station/features/info/widgets/edit_therapist_info_dialog.dart';
import 'package:emotion_station/features/info/widgets/parent_info_view.dart';
import 'package:emotion_station/features/info/widgets/therapist_info_view.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InfoScreenCubit>(
      create: (_) => Injector.locateService<InfoScreenCubit>(),
      child: const _InfoScreenView(),
    );
  }
}

class _InfoScreenView extends StatelessWidget {
  const _InfoScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final infoScreenCubit = context.read<InfoScreenCubit>();

    return BlocBuilder<InfoScreenCubit, InfoScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: state.currentUser.isSpecialist
                ? Text(l10n.infoScreenTitleSpecialist)
                : Text(l10n.infoScreenTitleParent),
            actions: state.currentUser.isSpecialist
                ? [
                    IconButton(
                      icon: const Icon(Icons.logout),
                      tooltip: l10n.signOutString,
                      onPressed: () {
                        infoScreenCubit.authenticationManager.signOut();
                        context.goNamed(EmotionStationRoutes.loginScreen.routeName);
                      },
                    ),
                  ]
                : [],
          ),
          body: Padding(
            //beware of const
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: state.currentUser is Specialist
                ? TherapistInfoScreenView(specialist: state.specialist ?? Specialist(id: ''))
                : ParentInfoScreenView(
                    parent: state.currentUser as Parent,
                    specialist: state.specialist ?? Specialist(id: ''),
                  ),

            /*
            if (state.currentUser is Specialist) {
          return TherapistTestWidget(specialist: state.currentUser as Specialist);
        } else if (state.currentUser is Parent) {
          return ParentTestWidget(parent: state.currentUser as Parent);
        } 
*/

/*            
            Center(
              child: Column(
                children: [
                  Text('current user full name: ${state.currentUser.fullName}'),
                  Text('current user email: ${state.currentUser.email}'),
                  Text(
                      ' is current user specialist? ${state.currentUser.isSpecialist.toString()} '),
                ],
              ),
            ),
*/
          ),
          floatingActionButton: state.currentUser.isParent
              ? FloatingActionButton.extended(
                  tooltip: l10n.testString2,
                  label: Text(l10n.signOutString),
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    infoScreenCubit.authenticationManager.signOut();
                    context.goNamed(EmotionStationRoutes.loginScreen.routeName);
                  },
                )
              : FloatingActionButton.extended(
                  tooltip: l10n.testString2,
                  label: Text(l10n.infoScreenEditInfo),
                  icon: const Icon(Icons.edit),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => EditTherapistInfoDialog(
                      databaseRepository: Injector.locateService<IDatabaseRepository>(),
                      specialistId: state.currentUser.id,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
