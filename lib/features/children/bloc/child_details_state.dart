part of 'child_details_cubit.dart';

class ChildDetailsState extends Equatable {
  const ChildDetailsState({
    this.activityRecords,
    required this.child,
    this.selectedEmotion = EmotionForecast.happy,
    this.selectedEmotionDate,
  });

  final List<ActivityRecord>? activityRecords;
  final Child child;
  final EmotionForecast selectedEmotion;
  final DateTime? selectedEmotionDate;

  ChildDetailsState copyWith({
    List<ActivityRecord>? activityRecords,
    Child? child,
    EmotionForecast? selectedEmotion,
    DateTime? selectedEmotionDate,
  }) {
    return ChildDetailsState(
      activityRecords: activityRecords ?? this.activityRecords,
      child: child ?? this.child,
      selectedEmotion: selectedEmotion ?? this.selectedEmotion,
      selectedEmotionDate: selectedEmotionDate ?? this.selectedEmotionDate,
    );
  }

  @override
  List<Object?> get props => [
        activityRecords,
        child,
        selectedEmotion,
        selectedEmotionDate,
      ];
}
