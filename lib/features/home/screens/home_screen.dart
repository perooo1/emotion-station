// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/bloc/sign_in_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (_) => Injector.locateService<SignInCubit>(),
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tempCubit = context.read<SignInCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.test_string_2),
      ),
      body: const Padding(
        //beware of const
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('This is a home widget when logged in'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //add logout functionality
        onPressed: () {
          tempCubit.signOut();
          context.goNamed(EmotionStationRoutes.registerScreen.routeName);
        },
        tooltip: l10n.test_string_2,
        child: const Icon(Icons.add),
      ),
    );
  }
}
