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
    required this.databaseRepository,
  }) : super(ChildDetailsState(child: child)) {
    _startListening();
  }

  final IDatabaseRepository databaseRepository;

  Stream<QuerySnapshot>? _activityRecordsStream;

  void selectForecastEmotion(EmotionForecast emotion) {
    emit(state.copyWith(selectedEmotion: emotion));
  }

  void selectForecastDate(DateTime date) {
    emit(state.copyWith(selectedEmotionDate: date));
  }

  _startListening() {
    _activityRecordsStream =
        databaseRepository.getRecordedActivitiesStream(childId: state.child.id);

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
  }
}
