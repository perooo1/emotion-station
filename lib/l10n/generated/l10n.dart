import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_hr.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hr')
  ];

  /// No description provided for @emotionStation.
  ///
  /// In en, this message translates to:
  /// **'Emotion Station'**
  String get emotionStation;

  /// No description provided for @testString.
  ///
  /// In en, this message translates to:
  /// **'this is a test string'**
  String get testString;

  /// No description provided for @yesString.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yesString;

  /// No description provided for @noString.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get noString;

  /// No description provided for @testString2.
  ///
  /// In en, this message translates to:
  /// **'random'**
  String get testString2;

  /// No description provided for @emailString.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailString;

  /// No description provided for @passwordString.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordString;

  /// No description provided for @nameString.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameString;

  /// No description provided for @lastNameString.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastNameString;

  /// No description provided for @connectWithParent.
  ///
  /// In en, this message translates to:
  /// **'Connect with parent'**
  String get connectWithParent;

  /// No description provided for @parentEmail.
  ///
  /// In en, this message translates to:
  /// **'Parent\'s Email'**
  String get parentEmail;

  /// No description provided for @exitString.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exitString;

  /// No description provided for @cancelString.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelString;

  /// No description provided for @signOutString.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOutString;

  /// No description provided for @addChildString.
  ///
  /// In en, this message translates to:
  /// **'Add child'**
  String get addChildString;

  /// No description provided for @unknownString.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownString;

  /// No description provided for @addNoteString.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get addNoteString;

  /// No description provided for @childAnsweredString.
  ///
  /// In en, this message translates to:
  /// **'The child answered'**
  String get childAnsweredString;

  /// No description provided for @totalDurationString.
  ///
  /// In en, this message translates to:
  /// **'Total duration'**
  String get totalDurationString;

  /// No description provided for @timeChartString.
  ///
  /// In en, this message translates to:
  /// **'Time chart'**
  String get timeChartString;

  /// No description provided for @comprehensionLevelChartString.
  ///
  /// In en, this message translates to:
  /// **'Comprehension level chart'**
  String get comprehensionLevelChartString;

  /// No description provided for @radarChartString.
  ///
  /// In en, this message translates to:
  /// **'Radar chart'**
  String get radarChartString;

  /// No description provided for @leftAxisTitleTimeBarChart.
  ///
  /// In en, this message translates to:
  /// **'Time [s]'**
  String get leftAxisTitleTimeBarChart;

  /// No description provided for @activityFinishedDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'You have finished your journey and reached emotion station! You can now give back the phone to your parents!'**
  String get activityFinishedDialogMessage;

  /// No description provided for @activityFinishedDialogButtonText.
  ///
  /// In en, this message translates to:
  /// **'Back to stations screen'**
  String get activityFinishedDialogButtonText;

  /// No description provided for @activityScreenNextStation.
  ///
  /// In en, this message translates to:
  /// **'Next Station'**
  String get activityScreenNextStation;

  /// No description provided for @exitActivityDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Exit the activity?'**
  String get exitActivityDialogTitle;

  /// No description provided for @exitActivityDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Ask your parent if you can exit the activity! If you exit current data will be lost.'**
  String get exitActivityDialogContent;

  /// No description provided for @infoScreenTitleParent.
  ///
  /// In en, this message translates to:
  /// **'Therapist Info'**
  String get infoScreenTitleParent;

  /// No description provided for @infoScreenTitleSpecialist.
  ///
  /// In en, this message translates to:
  /// **'Your Info'**
  String get infoScreenTitleSpecialist;

  /// No description provided for @infoScreenEditInfo.
  ///
  /// In en, this message translates to:
  /// **'Edit Info'**
  String get infoScreenEditInfo;

  /// No description provided for @infoScreenOccupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get infoScreenOccupation;

  /// No description provided for @infoScreenWorkplace.
  ///
  /// In en, this message translates to:
  /// **'Workplace'**
  String get infoScreenWorkplace;

  /// No description provided for @infoScreenWorkHours.
  ///
  /// In en, this message translates to:
  /// **'Business hours'**
  String get infoScreenWorkHours;

  /// No description provided for @infoScreenPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get infoScreenPhoneNumber;

  /// No description provided for @infoScreenAdditionalEducation.
  ///
  /// In en, this message translates to:
  /// **'Additional education'**
  String get infoScreenAdditionalEducation;

  /// No description provided for @infoScreenTherapistNotConnectedMessage.
  ///
  /// In en, this message translates to:
  /// **'When you connect with therapist, here you will be able to see information about them.'**
  String get infoScreenTherapistNotConnectedMessage;

  /// No description provided for @infoScreenEditTherapistInfoDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'Parents will see the info you enter here'**
  String get infoScreenEditTherapistInfoDialogMessage;

  /// No description provided for @stationOfHappiness.
  ///
  /// In en, this message translates to:
  /// **'Station of Happiness'**
  String get stationOfHappiness;

  /// No description provided for @stationOfSadness.
  ///
  /// In en, this message translates to:
  /// **'Station of Sadness'**
  String get stationOfSadness;

  /// No description provided for @stationOfFear.
  ///
  /// In en, this message translates to:
  /// **'Station of Fear'**
  String get stationOfFear;

  /// No description provided for @stationOfAnger.
  ///
  /// In en, this message translates to:
  /// **'Station of Anger'**
  String get stationOfAnger;

  /// No description provided for @childrenScreenParentTitle.
  ///
  /// In en, this message translates to:
  /// **'Your children'**
  String get childrenScreenParentTitle;

  /// No description provided for @childrenScreenSpecialistTitle.
  ///
  /// In en, this message translates to:
  /// **'Assigned children'**
  String get childrenScreenSpecialistTitle;

  /// No description provided for @childrenScreenConnectWithParentDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter email of a parent you wish to send a connection request.'**
  String get childrenScreenConnectWithParentDialogMessage;

  /// No description provided for @childrenScreenEnterChildInfoMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter required info about your child'**
  String get childrenScreenEnterChildInfoMessage;

  /// No description provided for @childrenScreenEnterChildName.
  ///
  /// In en, this message translates to:
  /// **'Child name:'**
  String get childrenScreenEnterChildName;

  /// No description provided for @childrenScreenEnterChildLast_name.
  ///
  /// In en, this message translates to:
  /// **'Child last name:'**
  String get childrenScreenEnterChildLast_name;

  /// No description provided for @childrenScreenEnterChildAge.
  ///
  /// In en, this message translates to:
  /// **'Child age:'**
  String get childrenScreenEnterChildAge;

  /// No description provided for @childrenScreenEnterChildGender.
  ///
  /// In en, this message translates to:
  /// **'Child gender:'**
  String get childrenScreenEnterChildGender;

  /// No description provided for @childrenScreenEnterChildDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis:'**
  String get childrenScreenEnterChildDiagnosis;

  /// No description provided for @childrenScreenEnterChildBoy.
  ///
  /// In en, this message translates to:
  /// **'Boy'**
  String get childrenScreenEnterChildBoy;

  /// No description provided for @childrenScreenEnterChildGirl.
  ///
  /// In en, this message translates to:
  /// **'Girl'**
  String get childrenScreenEnterChildGirl;

  /// No description provided for @childrenScreenEnterChildPregnancyBirthWeek.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy birth week'**
  String get childrenScreenEnterChildPregnancyBirthWeek;

  /// No description provided for @childrenScreenEnterChildPregnancyTreatmentStartMonth.
  ///
  /// In en, this message translates to:
  /// **'Select treatment start month'**
  String get childrenScreenEnterChildPregnancyTreatmentStartMonth;

  /// No description provided for @childrenScreenEnterChildPregnancyStartOfTreatment.
  ///
  /// In en, this message translates to:
  /// **'Start of treatment'**
  String get childrenScreenEnterChildPregnancyStartOfTreatment;

  /// No description provided for @childrenScreenEnterChildAttendsKindergarten.
  ///
  /// In en, this message translates to:
  /// **'Attends kindergarten?'**
  String get childrenScreenEnterChildAttendsKindergarten;

  /// No description provided for @childrenScreenEnterChildRiskyPregnancy.
  ///
  /// In en, this message translates to:
  /// **'Risky pregnancy?'**
  String get childrenScreenEnterChildRiskyPregnancy;

  /// No description provided for @childDetailsScreenAddEmotion.
  ///
  /// In en, this message translates to:
  /// **'Add emotion'**
  String get childDetailsScreenAddEmotion;

  /// No description provided for @childDetailsScreenAllEmotions.
  ///
  /// In en, this message translates to:
  /// **'All emotions'**
  String get childDetailsScreenAllEmotions;

  /// No description provided for @childDetailsScreenChildInfo.
  ///
  /// In en, this message translates to:
  /// **'Child info'**
  String get childDetailsScreenChildInfo;

  /// No description provided for @childDetailsScreenChildActivities.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get childDetailsScreenChildActivities;

  /// No description provided for @childDetailsScreenChildActivitiesOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get childDetailsScreenChildActivitiesOverview;

  /// No description provided for @childDetailsScreenChildActivitiesCompletedActivities.
  ///
  /// In en, this message translates to:
  /// **'Completed activities'**
  String get childDetailsScreenChildActivitiesCompletedActivities;

  /// No description provided for @childDetailsScreenEmotionRecognition.
  ///
  /// In en, this message translates to:
  /// **'Emotion recognition'**
  String get childDetailsScreenEmotionRecognition;

  /// No description provided for @childDetailsScreenEmotionTextualUnderstanding.
  ///
  /// In en, this message translates to:
  /// **'Textual understanding'**
  String get childDetailsScreenEmotionTextualUnderstanding;

  /// No description provided for @childDetailsScreenEmotionVisualUnderstanding.
  ///
  /// In en, this message translates to:
  /// **'Visual understanding'**
  String get childDetailsScreenEmotionVisualUnderstanding;

  /// No description provided for @childDetailsScreenRecognition.
  ///
  /// In en, this message translates to:
  /// **'Recognition'**
  String get childDetailsScreenRecognition;

  /// No description provided for @childDetailsScreenUnderstanding.
  ///
  /// In en, this message translates to:
  /// **'Understanding'**
  String get childDetailsScreenUnderstanding;

  /// No description provided for @childDetailsScreenUnderstandingTextual.
  ///
  /// In en, this message translates to:
  /// **'Textual'**
  String get childDetailsScreenUnderstandingTextual;

  /// No description provided for @childDetailsScreenUnderstandingVisual.
  ///
  /// In en, this message translates to:
  /// **'Visual'**
  String get childDetailsScreenUnderstandingVisual;

  /// No description provided for @emotionForecast.
  ///
  /// In en, this message translates to:
  /// **'Emotion Forecast'**
  String get emotionForecast;

  /// No description provided for @emotionForecastSad.
  ///
  /// In en, this message translates to:
  /// **'Sad, Weepy '**
  String get emotionForecastSad;

  /// No description provided for @emotionForecastHappy.
  ///
  /// In en, this message translates to:
  /// **'Happy, In a good mood'**
  String get emotionForecastHappy;

  /// No description provided for @emotionForecastAngry.
  ///
  /// In en, this message translates to:
  /// **'Angry, Irritable'**
  String get emotionForecastAngry;

  /// No description provided for @emotionForecastAddEmotionDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'Choose a date and emotion of your child that day.'**
  String get emotionForecastAddEmotionDialogMessage;

  /// No description provided for @homeScreenSelectChildForActivity.
  ///
  /// In en, this message translates to:
  /// **'Please select child for activity'**
  String get homeScreenSelectChildForActivity;

  /// No description provided for @loginMessage.
  ///
  /// In en, this message translates to:
  /// **'Login to Emotion Station'**
  String get loginMessage;

  /// No description provided for @loginHereMessage.
  ///
  /// In en, this message translates to:
  /// **'Login here'**
  String get loginHereMessage;

  /// No description provided for @registerWithUsMessage.
  ///
  /// In en, this message translates to:
  /// **'Register to Emotion Station'**
  String get registerWithUsMessage;

  /// No description provided for @notRegisteredMessage.
  ///
  /// In en, this message translates to:
  /// **'Not registered?'**
  String get notRegisteredMessage;

  /// No description provided for @alreadyRegisteredMessage.
  ///
  /// In en, this message translates to:
  /// **'Already registered?'**
  String get alreadyRegisteredMessage;

  /// No description provided for @registerHereMessage.
  ///
  /// In en, this message translates to:
  /// **'Register here'**
  String get registerHereMessage;

  /// No description provided for @registerScreenSpecialistOption.
  ///
  /// In en, this message translates to:
  /// **'Register as Therapist'**
  String get registerScreenSpecialistOption;

  /// No description provided for @snackbarMessageLoginError.
  ///
  /// In en, this message translates to:
  /// **'Error Logging In'**
  String get snackbarMessageLoginError;

  /// No description provided for @snackbarMessageRegisterError.
  ///
  /// In en, this message translates to:
  /// **'Error registering the user.'**
  String get snackbarMessageRegisterError;

  /// No description provided for @snackbarMessageSelectOption.
  ///
  /// In en, this message translates to:
  /// **'Select option'**
  String get snackbarMessageSelectOption;

  /// No description provided for @errorLoadingDataGoToLoginScreen.
  ///
  /// In en, this message translates to:
  /// **'To Login screen'**
  String get errorLoadingDataGoToLoginScreen;

  /// No description provided for @errorLoadingDataMessage.
  ///
  /// In en, this message translates to:
  /// **'There was an error loding user data from network. Please login to the app.'**
  String get errorLoadingDataMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hr': return AppLocalizationsHr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
