// Flutter imports:
import 'package:emotion_station/navigation/navigation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
                color: Colors.cyan,
              ),
              Text(l10n.test_string),
              Text(
                l10n.register_with_us_message,
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
                        context.go(EmotionStationRoutes.loginScreen.path);
                      },
                      child: Text(l10n.login_here_message)),
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
  }
}
