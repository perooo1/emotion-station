// Flutter imports:
import 'package:emotion_station/features/children/bloc/children_screen_cubit.dart';
import 'package:emotion_station/features/children/children.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:emotion_station/authentication_flow/bloc/sign_in_cubit.dart';
import 'package:emotion_station/injector/injector.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:repository/repository.dart';

class ChildrenScreen extends StatelessWidget {
  const ChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChildrenScreenCubit>(
      create: (_) => Injector.locateService<ChildrenScreenCubit>(),
      child: const _ChildrenScreenView(),
    );
  }
}

class _ChildrenScreenView extends StatelessWidget {
  const _ChildrenScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tempCubit = context.read<ChildrenScreenCubit>();

    return BlocBuilder<ChildrenScreenCubit, ChildrenScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('this is children screen'),
          ),
          body: Padding(
            //beware of const
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        state.children?[index].fullName ?? 'child name at index $index iz null'),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: state.children?.length ?? 0,
              ),
/*
              child: Column(
                children: [
                  Text('This is children screen'),
                  const SizedBox(height: 16),

                  ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.children?[index].fullName ??
                            'child name at index $index iz null'),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemCount: state.children?.length ?? 0,
                  ),
                ],
              ),
*/
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AddChildDialog(
                authenticationManager: tempCubit.authenticationManager,
                databaseRepository: Injector.locateService<IDatabaseRepository>(),
              ),
            ),
          ),
        );
      },
    );
  }
}
