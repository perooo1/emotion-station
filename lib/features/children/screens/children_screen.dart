// Flutter imports:
import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/bloc/children_screen_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/bloc/sign_in_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class ChildrenScreen extends StatelessWidget {
  const ChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildrenScreenCubit>(
      create: (_) => Injector.locateService<ChildrenScreenCubit>(),
      child: const _ChildrenScreenView(),
    );
  }
}

class _ChildrenScreenView extends StatelessWidget {
  const _ChildrenScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tempCubit = context.read<ChildrenScreenCubit>();

    return BlocBuilder<ChildrenScreenCubit, ChildrenScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              state.currentUser is Specialist
                  ? l10n.childrenScreenSpecialistTitle
                  : l10n.childrenScreenParentTitle,
            ),
          ),
          body: Padding(
            //beware of const
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: state.currentUser is Specialist
                    ? TherapistChildrenScreenView(children: state.children)
                    : ParentChildrenScreenView(children: state.children)),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => state.currentUser.isSpecialist
                  ? ConnectWithParentDialog(
                      authenticationManager: tempCubit.authenticationManager,
                      databaseRepository: Injector.locateService<IDatabaseRepository>(),
                    )
                  : AddChildDialog(
                      authenticationManager: tempCubit.authenticationManager,
                      databaseRepository: Injector.locateService<IDatabaseRepository>(),
                    ),
            ),
          ),
        );
      },
    );
  }
}
