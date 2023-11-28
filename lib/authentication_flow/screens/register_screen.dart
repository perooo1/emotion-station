// Flutter imports:
import 'package:common/common.dart';
import 'package:emotion_station/components/components.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/bloc/register_cubit.dart';
import 'package:emotion_station/authentication_flow/bloc/sign_in_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (_) => Injector.locateService<RegisterCubit>(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => previous.submissionStatus != current.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus == SubmissionStatus.success) {
          context.goNamed(EmotionStationRoutes.homeScreen.routeName);
          return;
        }
        if (state.submissionStatus == SubmissionStatus.genericError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(l10n.snackbarMessageRegisterError)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 55),
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Image.asset(
                            height: 200,
                            width: 200,
                            Images.registerIconDarkMode,
                          )
                        : Image.asset(
                            height: 200,
                            color: Colors.purple,
                            colorBlendMode: BlendMode.lighten,
                            width: 200,
                            Images.registerIconLightMode,
                          ),
                    Text(
                      l10n.registerWithUsMessage,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        ESTextInput(
                          borderRadius: 16.0,
                          height: 56.0,
                          labelText: l10n.nameString,
                          onChanged: (value) => cubit.saveNameToState(value),
                        ),
                        const SizedBox(height: 16.0),
                        ESTextInput(
                          borderRadius: 16.0,
                          height: 56.0,
                          labelText: l10n.lastNameString,
                          onChanged: (value) => cubit.saveLastNameToState(value),
                        ),
                        const SizedBox(height: 16.0),
                        ESTextInput(
                          borderRadius: 16.0,
                          height: 56.0,
                          labelText: l10n.emailString,
                          onChanged: (value) => cubit.saveEmailToState(value),
                        ),
                        const SizedBox(height: 16.0),
                        ESTextInput(
                          borderRadius: 16.0,
                          height: 56.0,
                          labelText: l10n.passwordString,
                          obscureText: true,
                          onChanged: (value) => cubit.savePwdToState(value),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Text(l10n.registerScreenSpecialistOption),
                            const Spacer(),
                            Switch(
                              value: state.isSpecialist,
                              onChanged: (value) => cubit.setIsSpecialist(value),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                    state.submissionStatus == SubmissionStatus.inProgress
                        ? const CircularProgressIndicator()
                        : Column(
                            children: [
                              SizedBox(
                                height: 56,
                                width: double.infinity,
                                child: FilledButton(
                                  onPressed: () => cubit.onRegisterSubmit(),
                                  child: Text(l10n.registerHereMessage),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(l10n.alreadyRegisteredMessage),
                                  const SizedBox(width: 6),
                                  OutlinedButton(
                                    onPressed: () =>
                                        context.goNamed(EmotionStationRoutes.loginScreen.routeName),
                                    child: Text(l10n.loginHereMessage),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
