part of 'activity_cubit.dart';

class ActivityState extends Equatable {
  const ActivityState({
    required this.emotionStation,
    this.recognitionAnswer1,
    this.recognitionAnswer2,
    this.understandingVisualAnswer1,
    this.understandingVisualAnswer2,
    this.understandingTextualAnswer1,
    this.understandingTextualAnswer2,
    this.recognitionAnswer1Duration,
    this.recognitionAnswer2Duration,
    this.understandingVisualAnswer1Duration,
    this.understandingVisualAnswer2Duration,
    this.understandingTextualAnswer1Duration,
    this.understandingTextualAnswer2Duration,
  });

  final EmotionStation emotionStation;

  final ComprehensionLevel? recognitionAnswer1;
  final ComprehensionLevel? recognitionAnswer2;
  final ComprehensionLevel? understandingVisualAnswer1;
  final ComprehensionLevel? understandingVisualAnswer2;
  final ComprehensionLevel? understandingTextualAnswer1;
  final ComprehensionLevel? understandingTextualAnswer2;

  final Duration? recognitionAnswer1Duration;
  final Duration? recognitionAnswer2Duration;
  final Duration? understandingVisualAnswer1Duration;
  final Duration? understandingVisualAnswer2Duration;
  final Duration? understandingTextualAnswer1Duration;
  final Duration? understandingTextualAnswer2Duration;

  ActivityState copyWith({
    EmotionStation? emotionStation,
    ComprehensionLevel? recognitionAnswer1,
    ComprehensionLevel? recognitionAnswer2,
    ComprehensionLevel? understandingVisualAnswer1,
    ComprehensionLevel? understandingVisualAnswer2,
    ComprehensionLevel? understandingTextualAnswer1,
    ComprehensionLevel? understandingTextualAnswer2,
    Duration? recognitionAnswer1Duration,
    Duration? recognitionAnswer2Duration,
    Duration? understandingVisualAnswer1Duration,
    Duration? understandingVisualAnswer2Duration,
    Duration? understandingTextualAnswer1Duration,
    Duration? understandingTextualAnswer2Duration,
  }) {
    return ActivityState(
      emotionStation: emotionStation ?? this.emotionStation,
      //answers
      recognitionAnswer1: recognitionAnswer1 ?? this.recognitionAnswer1,
      recognitionAnswer2: recognitionAnswer2 ?? this.recognitionAnswer2,
      understandingVisualAnswer1: understandingVisualAnswer1 ?? this.understandingVisualAnswer1,
      understandingVisualAnswer2: understandingVisualAnswer2 ?? this.understandingVisualAnswer2,
      understandingTextualAnswer1: understandingTextualAnswer1 ?? this.understandingTextualAnswer1,
      understandingTextualAnswer2: understandingTextualAnswer2 ?? this.understandingTextualAnswer2,
      //duration

      recognitionAnswer1Duration: recognitionAnswer1Duration ?? this.recognitionAnswer1Duration,
      recognitionAnswer2Duration: recognitionAnswer2Duration ?? this.recognitionAnswer2Duration,
      understandingTextualAnswer1Duration:
          understandingTextualAnswer1Duration ?? this.understandingTextualAnswer1Duration,
      understandingTextualAnswer2Duration:
          understandingTextualAnswer2Duration ?? this.understandingTextualAnswer2Duration,
      understandingVisualAnswer1Duration:
          understandingVisualAnswer1Duration ?? this.understandingVisualAnswer1Duration,
      understandingVisualAnswer2Duration:
          understandingVisualAnswer2Duration ?? this.understandingVisualAnswer2Duration,
    );
  }

  @override
  List<Object?> get props => [
        emotionStation,
        recognitionAnswer1,
        recognitionAnswer2,
        understandingVisualAnswer1,
        understandingVisualAnswer2,
        understandingTextualAnswer1,
        understandingTextualAnswer2,
        recognitionAnswer1Duration,
        recognitionAnswer2Duration,
        understandingVisualAnswer1Duration,
        understandingVisualAnswer2Duration,
        understandingTextualAnswer1Duration,
        understandingTextualAnswer2Duration,
      ];
}
