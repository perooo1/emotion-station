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
