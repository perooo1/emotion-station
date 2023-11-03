import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'completed_activity_state.dart';

@Injectable()
class CompletedActivityCubit extends Cubit<CompletedActivityState> {
  CompletedActivityCubit({@factoryParam required ActivityRecord activityRecord})
      : super(CompletedActivityState(activityRecord: activityRecord));
}
