import 'l10n.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emotionStation => 'Emotion Station';

  @override
  String get testString => 'this is a test string';

  @override
  String get testString2 => 'random';

  @override
  String get emailString => 'Email';

  @override
  String get passwordString => 'Password';

  @override
  String get nameString => 'Name';

  @override
  String get lastNameString => 'Last Name';

  @override
  String get connectWithParent => 'Connect with parent';

  @override
  String get parentEmail => 'Parent\'s Email';

  @override
  String get exitString => 'Exit';

  @override
  String get cancelString => 'Cancel';

  @override
  String get activityFinishedDialogMessage => 'You have finished your journey and reached emotion station! You can now give back the phone to your parents!';

  @override
  String get activityFinishedDialogButtonText => 'Back to stations screen';

  @override
  String get activityScreenNextStation => 'Next Station';

  @override
  String get exitActivityDialogTitle => 'Exit the activity?';

  @override
  String get exitActivityDialogContent => 'Ask your parent if you can exit the activity! If you exit current data will be lost.';

  @override
  String get stationOfHappiness => 'Station of Happiness';

  @override
  String get stationOfSadness => 'Station of Sadness';

  @override
  String get stationOfFear => 'Station of Fear';

  @override
  String get stationOfAnger => 'Station of Anger';

  @override
  String get childrenScreenParentTitle => 'Your children';

  @override
  String get childrenScreenSpecialistTitle => 'Assigned children';

  @override
  String get childrenScreenEnterChildInfoMessage => 'Please enter required info about your child';

  @override
  String get childrenScreenEnterChildName => 'Child name:';

  @override
  String get childrenScreenEnterChildLast_name => 'Child last name:';

  @override
  String get childrenScreenEnterChildAge => 'Child age:';

  @override
  String get childrenScreenEnterChildGender => 'Child gender:';

  @override
  String get childrenScreenEnterChildDiagnosis => 'Diagnosis:';

  @override
  String get childrenScreenEnterChildBoy => 'Boy';

  @override
  String get childrenScreenEnterChildGirl => 'Girl';

  @override
  String get childDetailsScreenAddEmotion => 'Add emotion';

  @override
  String get childDetailsScreenAllEmotions => 'All emotions';

  @override
  String get emotionForecastSad => 'Sad, Weepy ';

  @override
  String get emotionForecastHappy => 'Happy, In a good mood';

  @override
  String get emotionForecastAngry => 'Angry, Irritable';

  @override
  String get homeScreenSelectChildForActivity => 'Please select child for activity';

  @override
  String get loginMessage => 'Login to Emotion Station';

  @override
  String get loginHereMessage => 'Login here';

  @override
  String get registerWithUsMessage => 'Register to Emotion Station';

  @override
  String get notRegisteredMessage => 'Not registered?';

  @override
  String get alreadyRegisteredMessage => 'Already registered?';

  @override
  String get registerHereMessage => 'Register here';

  @override
  String get registerScreenSpecialistOption => 'Register as Therapist';

  @override
  String get snackbarMessageLoginError => 'Error Logging In';

  @override
  String get snackbarMessageRegisterError => 'Error registering the user.';

  @override
  String get snackbarMessageSelectOption => 'Select option';

  @override
  String get errorLoadingDataGoToLoginScreen => 'To Login screen';

  @override
  String get errorLoadingDataMessage => 'There was an error loding user data from network. Please login to the app.';
}
