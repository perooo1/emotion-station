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
  int currentPageIndex = 0;

  final stopwatch = Stopwatch()..start();

  bool isOptionSelected() {
    switch (currentPageIndex) {
      case 0:
        return state.recognitionAnswer1 != null;
      case 1:
        return state.recognitionAnswer2 != null;
      case 2:
        return state.understandingTextualAnswer1 != null;
      case 3:
        return state.understandingTextualAnswer2 != null;
      case 4:
        return state.understandingVisualAnswer1 != null;
      default:
        return state.understandingVisualAnswer2 != null;
    }
  }

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

  void recordActivity() {
    //todo make async and future type BE CAREFUL OF LAST TIMER

    final activityRecord = ActivityRecord(
      emotionStation: state.emotionStation,
      recognitionAnswer1: state.recognitionAnswer1!,
      recognitionAnswer2: state.recognitionAnswer2!,
      understandingTextualAnswer1: state.understandingTextualAnswer1!,
      understandingTextualAnswer2: state.understandingTextualAnswer2!,
      understandingVisualAnswer1: state.understandingVisualAnswer1!,
      understandingVisualAnswer2: state.understandingVisualAnswer2!,
      recognitionAnswer1Duration: state.recognitionAnswer1Duration!,
      recognitionAnswer2Duration:
          state.recognitionAnswer2Duration! - state.recognitionAnswer1Duration!,
      understandingTextualAnswer1Duration:
          state.understandingTextualAnswer1Duration! - state.recognitionAnswer2Duration!,
      understandingTextualAnswer2Duration:
          state.understandingTextualAnswer2Duration! - state.understandingTextualAnswer1Duration!,
      understandingVisualAnswer1Duration:
          state.understandingVisualAnswer1Duration! - state.understandingTextualAnswer2Duration!,
      understandingVisualAnswer2Duration:
          state.understandingVisualAnswer2Duration! - state.understandingVisualAnswer1Duration!,
    );
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
