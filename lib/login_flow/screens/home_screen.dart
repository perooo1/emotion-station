// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:emotion_station/l10n/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
        onPressed: () {},
        tooltip: l10n.test_string_2,
        child: const Icon(Icons.add),
      ),
    );
  }
}
