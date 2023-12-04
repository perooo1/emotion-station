part of 'child_details_cubit.dart';

class ChildDetailsState extends Equatable {
  const ChildDetailsState({
    this.activityRecords,
    required this.child,
    this.selectedEmotion = EmotionForecast.happy,
    this.selectedEmotionAddDialog = EmotionForecast.happy,
    this.selectedEmotionDateAddDialog,
    this.emotionForecast,
    this.emotionsInCalendar = EmotionsInCalendar.all,
  });

  final List<ActivityRecord>? activityRecords;
  final Child child;
  final EmotionForecast selectedEmotion;
  final EmotionForecast selectedEmotionAddDialog;
  final DateTime? selectedEmotionDateAddDialog;
  final Map<DateTime, EmotionForecast>? emotionForecast;
  final EmotionsInCalendar emotionsInCalendar;

  ChildDetailsState copyWith({
    List<ActivityRecord>? activityRecords,
    Child? child,
    EmotionForecast? selectedEmotion,
    EmotionForecast? selectedEmotionAddDialog,
    DateTime? selectedEmotionDateAddDialog,
    Map<DateTime, EmotionForecast>? emotionForecast,
    EmotionsInCalendar? emotionsInCalendar,
  }) {
    return ChildDetailsState(
      activityRecords: activityRecords ?? this.activityRecords,
      child: child ?? this.child,
      selectedEmotion: selectedEmotion ?? this.selectedEmotion,
      selectedEmotionAddDialog: selectedEmotionAddDialog ?? this.selectedEmotionAddDialog,
      selectedEmotionDateAddDialog:
          selectedEmotionDateAddDialog ?? this.selectedEmotionDateAddDialog,
      emotionForecast: emotionForecast ?? this.emotionForecast,
      emotionsInCalendar: emotionsInCalendar ?? this.emotionsInCalendar,
    );
  }

  @override
  List<Object?> get props => [
        activityRecords,
        child,
        selectedEmotion,
        selectedEmotionAddDialog,
        selectedEmotionDateAddDialog,
        emotionForecast,
        emotionsInCalendar,
      ];
}

enum EmotionsInCalendar { all, sad, happy, angry }
