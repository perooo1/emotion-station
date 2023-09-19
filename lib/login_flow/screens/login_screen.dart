// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:emotion_station/l10n/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                l10n.test_string,
                //'You have pushed the button this many times:',
              ),
              Text(
                l10n.test_string,

                //              '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter password here',
                  //filled: true,
                  //fillColor: Colors.primaries.first,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: l10n.test_string_2,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

/*
    return Center(
      child: Container(color: Colors.red, child: Text('This is intro screen')),
    );
*/
  }
}
