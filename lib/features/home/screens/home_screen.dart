// Flutter imports:
import 'package:common/common.dart';
import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:emotion_station/features/home/bloc/home_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => Injector.locateService<HomeCubit>(),
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tempCubit = context.read<HomeCubit>();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        final parent = state.currentUser as Parent;

        if (parent.assignedSpecialistId != null &&
            parent.specialistConnectionApproved == false &&
            state.specialistConnectionDialogShown == false) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Terapeut se želi povezati'),
              content: Text(
                  'Terapeut s id ${parent.assignedSpecialistId} se želi povezati s Vama.'),
              actions: [
                TextButton(
                  onPressed: () {
                    tempCubit.declineSpecialistConnection();
                    context.pop();
                  },
                  child: Text(l10n.declineString),
                ),
                TextButton(
                    onPressed: () {
                      tempCubit.approveSpecialistConnection();
                      context.pop();
                    },
                    child: Text(l10n.approveString)),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.currentUser is Specialist) {
          return TherapistTestWidget(
              specialist: state.currentUser as Specialist);
        } else if (state.currentUser is Parent) {
          return ParentTestWidget(parent: state.currentUser as Parent);
        } else {
          Future.delayed(
            Duration.zero,
            () => showDialog(
              context: context,
              builder: (context) => Dialog.fullscreen(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Images.dataLoadingErrorImage),
                      const SizedBox(height: 16.0),
                      Text(l10n.errorLoadingDataMessage),
                      FilledButton(
                        onPressed: () {
                          tempCubit.authenticationManager.signOut();
                          context.goNamed(
                              EmotionStationRoutes.loginScreen.routeName);
                        },
                        child: Text(l10n.errorLoadingDataGoToLoginScreen),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          return const Placeholder();
        }
      },
    );
  }
}
