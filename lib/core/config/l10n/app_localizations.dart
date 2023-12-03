import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('ko')
  ];

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'Hej !'**
  String get hi;

  /// No description provided for @as_a.
  ///
  /// In en, this message translates to:
  /// **'As a'**
  String get as_a;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact with email'**
  String get contact;

  /// No description provided for @intro.
  ///
  /// In en, this message translates to:
  /// **' developer specializing in multi-platform app development and an expert in implementing stable and efficient backends using NestJS. I focus on creating modern and performance-optimized apps through user-centric UI/UX design and robust server functionalities.'**
  String get intro;

  /// No description provided for @strength_1.
  ///
  /// In en, this message translates to:
  /// **' I\'m a Flutter developer with a knack for applying sophisticated UI/UX. With in-depth expertise in the Flutter framework, I seamlessly integrate the latest tech trends and innovative development techniques. My continuous learning, coupled with a commitment to ongoing code improvement and optimization, allows me to consistently deliver efficient and high-quality software.'**
  String get strength_1;

  /// No description provided for @strength_2.
  ///
  /// In en, this message translates to:
  /// **' I\'m a Flutter developer with a knack for applying sophisticated UI/UX. With in-depth expertise in the Flutter framework, I seamlessly integrate the latest tech trends and innovative development techniques. My continuous learning, coupled with a commitment to ongoing code improvement and optimization, allows me to consistently deliver efficient and high-quality software.'**
  String get strength_2;

  /// No description provided for @strength_3.
  ///
  /// In en, this message translates to:
  /// **' I have an in-depth and extensive understanding of the Flutter framework. With Widget\'s expertise in lifecycle and health management, you can respond to complex UI/UX challenges. We focus on design that takes into account the scalability and maintenance of the project while effectively leveraging the diverse capabilities of Flutter to enhance user experience and contribute to performance optimization.'**
  String get strength_3;

  /// No description provided for @strength_4.
  ///
  /// In en, this message translates to:
  /// **' Through many projects, we have increased our capacity for continuous code improvement and optimization. We strive to improve the readability and maintenance of the code in the course of the project, and we have increased the efficiency of the project by applying the latest development tools and technologies. We continuously improved the quality of our projects by responding quickly to changes in user requirements and optimizing the performance of our codebase.'**
  String get strength_4;

  /// No description provided for @about_me.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get about_me;

  /// No description provided for @skill.
  ///
  /// In en, this message translates to:
  /// **' Front-end developments mainly use Flutter, Kotlin, and Swift to build dynamic and intuitive user interfaces. In the back-end area, the Nest.js framework is used to build reliable and scalable servers. On the operational side, Firebase is used to build monitoring and performance measurement environments, and Fastlane is used to automate the build and deployment of applications. In addition, it uses tools such as Shorebird to carry out the code push of the app. It systematically performs collaboration and version management through Git, and plans and promotes projects using Jira and Confluence.'**
  String get skill;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ko': return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
