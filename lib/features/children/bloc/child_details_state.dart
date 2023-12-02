part of 'child_details_cubit.dart';

class ChildDetailsState extends Equatable {
  const ChildDetailsState({
    this.activityRecords,
    required this.child,
    this.selectedEmotion = EmotionForecast.happy,
    this.selectedEmotionDate,
    this.emotionForecast,
  });

  final List<ActivityRecord>? activityRecords;
  final Child child;
  final EmotionForecast selectedEmotion;
  final DateTime? selectedEmotionDate;
  final Map<DateTime, EmotionForecast>? emotionForecast;

  ChildDetailsState copyWith({
    List<ActivityRecord>? activityRecords,
    Child? child,
    EmotionForecast? selectedEmotion,
    DateTime? selectedEmotionDate,
    Map<DateTime, EmotionForecast>? emotionForecast,
  }) {
    return ChildDetailsState(
      activityRecords: activityRecords ?? this.activityRecords,
      child: child ?? this.child,
      selectedEmotion: selectedEmotion ?? this.selectedEmotion,
      selectedEmotionDate: selectedEmotionDate ?? this.selectedEmotionDate,
      emotionForecast: emotionForecast ?? this.emotionForecast,
    );
  }

  @override
  List<Object?> get props => [
        activityRecords,
        child,
        selectedEmotion,
        selectedEmotionDate,
        emotionForecast,
      ];
}
