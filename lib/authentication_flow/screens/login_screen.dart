// Flutter imports:
import 'package:emotion_station/components/components.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/bloc/sign_in_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/navigation/navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (_) => Injector.locateService<SignInCubit>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final SignInCubit cubit = context.read<SignInCubit>();

    return BlocConsumer<SignInCubit, SignInState>(
      listenWhen: (previous, current) => previous.submissionStatus != current.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus == SubmissionStatus.success) {
          context.goNamed(EmotionStationRoutes.homeScreen.routeName);
          return;
        }
        if (state.submissionStatus == SubmissionStatus.genericError ||
            state.submissionStatus == SubmissionStatus.invalidCredentialsError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('error loggin in user')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.account_circle_sharp,
                    size: 150.0,
                    color: Colors.amber,
                  ),
                  Text(
                    l10n.login_message,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  if (state.submissionStatus == SubmissionStatus.inProgress)
                    const CircularProgressIndicator(),
                  ESTextInput(
                    borderRadius: 16.0,
                    height: 56.0,
                    labelText: l10n.email_string,
                    onChanged: (email) => cubit.saveEmailToState(email),
                  ),
                  const SizedBox(height: 16.0),
                  ESTextInput(
                    borderRadius: 16.0,
                    height: 56.0,
                    labelText: l10n.email_string,
                    obscureText: true,
                    onChanged: (password) => cubit.savePwdToState(password),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => cubit.onLoginSubmit(),
                      child: Text(l10n.login_message),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.not_registered_message),
                      const SizedBox(width: 6),
                      OutlinedButton(
                        onPressed: () {
                          context.goNamed(EmotionStationRoutes.registerScreen.routeName);
                        },
                        child: Text(l10n.register_here_message),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
