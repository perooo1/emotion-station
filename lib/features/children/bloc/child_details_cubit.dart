import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

part 'child_details_state.dart';

@Injectable()
class ChildDetailsCubit extends Cubit<ChildDetailsState> {
  ChildDetailsCubit({
    @factoryParam required Child child,
    required this.authenticationManager,
    required this.databaseRepository,
  }) : super(ChildDetailsState(child: child)) {
    _startListening();
  }

  final IAuthenticationManager authenticationManager;
  final IDatabaseRepository databaseRepository;

  Stream<QuerySnapshot>? _activityRecordsStream;
  Stream<QuerySnapshot>? _singleChildStream;

  void selectForecastEmotionToDisplay(EmotionsInCalendar emotion) {
    emit(state.copyWith(emotionsInCalendar: emotion));
  }

/*
  void selectForecastEmotionToDisplay(EmotionForecast emotion) {
    emit(state.copyWith(selectedEmotion: emotion));
  }
*/
  void selectForecastEmotionAddDialog(EmotionForecast emotion) {
    emit(state.copyWith(selectedEmotionAddDialog: emotion));
  }

  void selectForecastDateAddDialog(DateTime date) {
    emit(state.copyWith(selectedEmotionDateAddDialog: DateTime(date.year, date.month, date.day)));
  }

  Future<void> updateChildEmotionForecast() async {
    final forecast = state.emotionForecast;
    if (forecast != null) {
      forecast[state.selectedEmotionDateAddDialog ?? DateTime.now()] =
          state.selectedEmotionAddDialog;

      final a = await databaseRepository.updateChildEmotionForecast(
        childId: state.child.id,
        forecast: forecast,
      );
    } else {
      final Map<DateTime, EmotionForecast> newForecast = {
        state.selectedEmotionDateAddDialog ?? DateTime.now(): state.selectedEmotionAddDialog
      };

      final a = await databaseRepository.updateChildEmotionForecast(
        childId: state.child.id,
        forecast: newForecast,
      );
    }
  }

  _startListening() {
    _activityRecordsStream =
        databaseRepository.getRecordedActivitiesStream(childId: state.child.id);

    _singleChildStream = databaseRepository.getSingleChildStream(childId: state.child.id);

    _activityRecordsStream?.listen(
      (querySnapshot) {
        final List<ActivityRecord> records = [];
        for (var doc in querySnapshot.docs) {
          records.add(ActivityRecord.fromJson(doc.data() as Map<String, dynamic>));
        }
        records.sort((a, b) => b.timeOfActivity.compareTo(a.timeOfActivity));
        emit(state.copyWith(activityRecords: records, child: null));
        //emit(state.copyWith(activityRecords: records));
      },
    );

    _singleChildStream?.listen(
      (querySnapshot) {
        //final DocumentSnapshot child = querySnapshot.docs[0];
        final Child child = Child.fromJson(querySnapshot.docs[0].data() as Map<String, dynamic>);

        emit(state.copyWith(emotionForecast: child.emotionForecast));
      },
    );
  }
}
