// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/bloc/sign_in_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (_) => Injector.locateService<SignInCubit>(),
      child: const _TestScreenView(),
    );
  }
}

class _TestScreenView extends StatelessWidget {
  const _TestScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tempCubit = context.read<SignInCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('this is a test screen'),
      ),
      body: const Padding(
        //beware of const
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text('This is test screen for navbar'),
        ),
      ),
    );
  }
}