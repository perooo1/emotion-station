// Flutter imports:
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
            ..showSnackBar(const SnackBar(content: Text('error registering user')));
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
                            'assets/images/register_icon_dark_mode.png',
                          )
                        : Image.asset(
                            height: 200,
                            color: Colors.purple,
                            colorBlendMode: BlendMode.lighten,
                            width: 200,
                            'assets/images/register_icon_light_mode.webp',
                          ),
                    Text(
                      l10n.register_with_us_message,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        ESTextInput(
                          borderRadius: 16.0,
                          height: 56.0,
                          labelText: 'Name',
                          onChanged: (value) => cubit.saveNameToState(value),
                        ),
                        const SizedBox(height: 16.0),
                        ESTextInput(
                          borderRadius: 16.0,
                          height: 56.0,
                          labelText: 'Last Name',
                          onChanged: (value) => cubit.saveLastNameToState(value),
                        ),
                        const SizedBox(height: 16.0),
                        ESTextInput(
                          borderRadius: 16.0,
                          height: 56.0,
                          labelText: 'Email',
                          onChanged: (value) => cubit.saveEmailToState(value),
                        ),
                        const SizedBox(height: 16.0),
                        ESTextInput(
                          borderRadius: 16.0,
                          height: 56.0,
                          labelText: 'Password',
                          obscureText: true,
                          onChanged: (value) => cubit.savePwdToState(value),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            const Text('I AM A SPECIALIST'),
                            Switch(
                              value: state.isSpecialist,
                              onChanged: (value) => cubit.setIsSpecialist(value),
                            )
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
                                  child: Text(l10n.register_here_message),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(l10n.already_registered_message),
                                  const SizedBox(width: 6),
                                  OutlinedButton(
                                    onPressed: () =>
                                        context.goNamed(EmotionStationRoutes.loginScreen.routeName),
                                    child: Text(l10n.login_here_message),
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
