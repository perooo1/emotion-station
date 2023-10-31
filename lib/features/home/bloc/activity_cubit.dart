import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'activity_state.dart';

@Injectable()
class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit()
      : super(
          ActivityState(
            emotionStation: EmotionStation(
              activityType: ActivityType.stationOfHappiness,
              stationName: ActivityType.stationOfHappiness.name,
              questions: QuestionsCroatian().questionsHappiness,
            ),
          ),
        );

  final controller = PageController();

  void setAnswer(ComprehensionLevel? answer, int index) {
    //potential non-nullable parameter
    switch (index) {
      case 0:
        emit(state.copyWith(reckoginitionAnswer1: answer));
        break;
      case 1:
        emit(state.copyWith(reckoginitionAnswer2: answer));
        break;
      case 2:
        emit(state.copyWith(understandingTextualAnswer1: answer));
        break;
      case 3:
        emit(state.copyWith(understandingTextualAnswer2: answer));
        break;
      case 4:
        emit(state.copyWith(understandingVisualAnswer1: answer));
        break;
      default:
        emit(state.copyWith(understandingVisualAnswer2: answer));
        break;
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }

/*
  ActivityCubit(super.initialState) {
    state.copyWith(
      emotionStation: EmotionStation(
        activityType: ActivityType.stationOfHappiness,
        stationName: ActivityType.stationOfHappiness.name,
        questions: QuestionsCroatian().questionsHappiness,
      ),
    );
  }
*/
}
