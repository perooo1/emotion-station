// Flutter imports:
import 'package:emotion_station/authentication_flow/bloc/sign_in_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/navigation/navigation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
        create: (_) => Injector.locateService<SignInCubit>(), child: const _LoginView());

/*
    return Scaffold(
/*
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(l10n.test_string_2),
      ),
*/
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
              Text(l10n.test_string),
              Text(
                l10n.login_message,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 56,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: l10n.email_string,
                    //filled: true,
                    //fillColor: Colors.primaries.first,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onChanged: (value) => ,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 56,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: l10n.password_string,
                    //filled: true,
                    //fillColor: Colors.primaries.first,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
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
                        context.go(EmotionStationRoutes.registerScreen.path);
                      },
                      child: Text(l10n.register_here_message)),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: l10n.test_string_2,
        child: const Icon(Icons.add),
      ),
    );
  
  */
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
          context.goNamed(EmotionStationRoutes.homeScreen.path);
          return;
        }
      },
      builder: (context, state) {
        return Scaffold(
/*
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(l10n.test_string_2),
      ),
*/
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
                  //Text(l10n.test_string),
                  Text(state.testUser?.id ?? 'test user id is empty'),
                  Text(state.testUser?.email ?? 'testuser email is empty '),
                  Text('is test user empty? ${state.testUser?.isEmpty.toString()}'),
                  Text(
                    l10n.login_message,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 56,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: l10n.email_string,
                        //filled: true,
                        //fillColor: Colors.primaries.first,
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
                        //filled: true,
                        //fillColor: Colors.primaries.first,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onChanged: (value) => cubit.savePwdToState(value),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => cubit
                          .onLoginSubmit(), //dodat odlazak na home screen, tj trebao bi već biti zbog bloc consumera
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
                            context.go(EmotionStationRoutes.registerScreen.path);
                          },
                          child: Text(l10n.register_here_message)),
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
