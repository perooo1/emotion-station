part of 'activity_cubit.dart';

class ActivityState extends Equatable {
  const ActivityState({
    required this.emotionStation,
    this.reckoginitionAnswer1,
    this.reckoginitionAnswer2,
    this.understandingVisualAnswer1,
    this.understandingVisualAnswer2,
    this.understandingTextualAnswer1,
    this.understandingTextualAnswer2,
  });

  final EmotionStation emotionStation;
  //todo dodati odgovore na pitanja
  final ComprehensionLevel? reckoginitionAnswer1;
  final ComprehensionLevel? reckoginitionAnswer2;
  final ComprehensionLevel? understandingVisualAnswer1;
  final ComprehensionLevel? understandingVisualAnswer2;
  final ComprehensionLevel? understandingTextualAnswer1;
  final ComprehensionLevel? understandingTextualAnswer2;

  ActivityState copyWith({
    EmotionStation? emotionStation,
    ComprehensionLevel? reckoginitionAnswer1,
    ComprehensionLevel? reckoginitionAnswer2,
    ComprehensionLevel? understandingVisualAnswer1,
    ComprehensionLevel? understandingVisualAnswer2,
    ComprehensionLevel? understandingTextualAnswer1,
    ComprehensionLevel? understandingTextualAnswer2,
  }) {
    return ActivityState(
      emotionStation: emotionStation ?? this.emotionStation,
      reckoginitionAnswer1: reckoginitionAnswer1 ?? this.reckoginitionAnswer1,
      reckoginitionAnswer2: reckoginitionAnswer2 ?? this.reckoginitionAnswer2,
      understandingVisualAnswer1: understandingVisualAnswer1 ?? this.understandingVisualAnswer1,
      understandingVisualAnswer2: understandingVisualAnswer2 ?? this.understandingVisualAnswer2,
      understandingTextualAnswer1: understandingTextualAnswer1 ?? this.understandingTextualAnswer1,
      understandingTextualAnswer2: understandingTextualAnswer2 ?? this.understandingTextualAnswer2,
    );
  }

  @override
  List<Object?> get props => [
        emotionStation,
        reckoginitionAnswer1,
        reckoginitionAnswer2,
        understandingVisualAnswer1,
        understandingVisualAnswer2,
        understandingTextualAnswer1,
        understandingTextualAnswer2,
      ];
}
