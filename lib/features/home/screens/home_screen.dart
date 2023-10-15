// Flutter imports:
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
  const _HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tempCubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        /*
        return state.currentUser.isSpecialist
            ? TherapistTestWidget(specialist: state.currentUser)
            : ParentTestWidget(parent: state.currentUser);
*/

        if (state.currentUser is Specialist) {
          return TherapistTestWidget(specialist: state.currentUser as Specialist);
        } else if (state.currentUser is Parent) {
          return ParentTestWidget(parent: state.currentUser as Parent);
        } else {
          return Center(
              child: Text(
                  ' Uh oh! Molimo logirajte se ponovno')); //ovdje samo pushat full screen dialog s button za log out i odlazak na login ekran
        }

/*
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.test_string_2),
          ),
          body: Padding(
            //beware of const
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Text('This is a home widget when logged in'),
                  Text('Current logged in user id: ${state.currentUser.id}'),
                  Text('Current logged in user email: ${state.currentUser.email}'),
                  Text('Current logged in full name: ${state.currentUser.fullName}'),
                  Text(
                      'Current logged in user specialist from user obj? : ${state.currentUser.isSpecialist.toString()}'),
                ],
              ),
            ),
          ),

        );
*/
      },
    );
  }
}
