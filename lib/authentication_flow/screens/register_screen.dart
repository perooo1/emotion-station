// Flutter imports:
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
import 'package:repository/repository.dart';

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

/*
    final IAuthenticationManager authenticationManager =
        Injector.locateService<AuthenticationManager>();
*/
    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => previous.submissionStatus != current.submissionStatus,
      listener: (context, state) {
/*
        if (state.submissionStatus == SubmissionStatus.success &&
            authenticationManager.getCurrentUser().isSpecialist == true) {
          context.goNamed(EmotionStationRoutes.parentsOverviewScreen.routeName);
          return; 
        }
        if (state.submissionStatus == SubmissionStatus.success &&
            authenticationManager.getCurrentUser().isSpecialist != true) {
          context.goNamed(EmotionStationRoutes.stationActivityScreen.routeName);
          return;
        }
*/

        if (state.submissionStatus == SubmissionStatus.success) {
          context.goNamed(EmotionStationRoutes.infoScreen.routeName);
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.account_circle_sharp,
                    size: 150.0,
                    color: Colors.cyan,
                  ),
                  Text(l10n.test_string),
                  Text(
                    l10n.register_with_us_message,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  if (state.submissionStatus == SubmissionStatus.inProgress)
                    const CircularProgressIndicator(),
                  SizedBox(
                    height: 56,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        //filled: true,
                        //fillColor: Colors.primaries.first,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onChanged: (value) => cubit.saveNameToState(value),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'last name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onChanged: (value) => cubit.saveLastNameToState(value),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: l10n.email_string,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onChanged: (value) => cubit.saveEmailToState(value),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 56,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: l10n.password_string,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onChanged: (value) => cubit.savePwdToState(value),
                    ),
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
                        onPressed: () {
                          context.goNamed(EmotionStationRoutes.loginScreen.routeName);
                        },
                        child: Text(l10n.login_here_message),
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
