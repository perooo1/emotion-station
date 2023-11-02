import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';

class ChildDetailsScreen extends StatelessWidget {
  const ChildDetailsScreen({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(child.fullName), centerTitle: true),
      body: Center(
        child: Text('this is chlidl name: ${child.fullName} by id: ${child.id}'),
      ),
    );
  }
}
