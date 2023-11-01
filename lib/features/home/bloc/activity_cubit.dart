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
  int currentPage = 0;
  bool isFirstPageVisited = false;

  final stopwatch = Stopwatch()..start();

  void manageStopwatch() {
    // I dont like!!!!!!
    if (state.recognitionAnswer1 != null &&
        state.recognitionAnswer2 == null &&
        state.understandingTextualAnswer1 == null &&
        state.understandingTextualAnswer2 == null &&
        state.understandingVisualAnswer1 == null &&
        state.understandingVisualAnswer2 == null) {
      emit(state.copyWith(recognitionAnswer1Duration: stopwatch.elapsed));
    } else if (state.recognitionAnswer1 != null &&
        state.recognitionAnswer2 != null &&
        state.understandingTextualAnswer1 == null &&
        state.understandingTextualAnswer2 == null &&
        state.understandingVisualAnswer1 == null &&
        state.understandingVisualAnswer2 == null) {
      emit(state.copyWith(recognitionAnswer2Duration: stopwatch.elapsed));
    } else if (state.recognitionAnswer1 != null &&
        state.recognitionAnswer2 != null &&
        state.understandingTextualAnswer1 != null &&
        state.understandingTextualAnswer2 == null &&
        state.understandingVisualAnswer1 == null &&
        state.understandingVisualAnswer2 == null) {
      emit(state.copyWith(understandingTextualAnswer1Duration: stopwatch.elapsed));
    } else if (state.recognitionAnswer1 != null &&
        state.recognitionAnswer2 != null &&
        state.understandingTextualAnswer1 != null &&
        state.understandingTextualAnswer2 != null &&
        state.understandingVisualAnswer1 == null &&
        state.understandingVisualAnswer2 == null) {
      emit(state.copyWith(understandingTextualAnswer2Duration: stopwatch.elapsed));
    } else if (state.recognitionAnswer1 != null &&
        state.recognitionAnswer2 != null &&
        state.understandingTextualAnswer1 != null &&
        state.understandingTextualAnswer2 != null &&
        state.understandingVisualAnswer1 != null &&
        state.understandingVisualAnswer2 == null) {
      emit(state.copyWith(understandingVisualAnswer1Duration: stopwatch.elapsed));
    } else {
      emit(state.copyWith(understandingVisualAnswer2Duration: stopwatch.elapsed));
      stopwatch.stop();
    }
    /*
     else if (state.recognitionAnswer1 != null &&
        state.recognitionAnswer2 != null &&
        state.understandingTextualAnswer1 != null &&
        state.understandingTextualAnswer2 != null &&
        state.understandingVisualAnswer1 != null &&
        state.understandingVisualAnswer2 != null) {
      emit(state.copyWith(understandingVisualAnswer2Duration: stopwatch.elapsed));
      stopwatch.stop();
    }
    */
  }

  void setAnswer(ComprehensionLevel? answer, int index) {
    //potential non-nullable parameter
    switch (index) {
      case 0:
        emit(state.copyWith(recognitionAnswer1: answer));
        break;
      case 1:
        emit(state.copyWith(recognitionAnswer2: answer));
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
