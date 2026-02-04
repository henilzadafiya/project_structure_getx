// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log in`
  String get login {
    return Intl.message('Log in', name: 'login', desc: '', args: []);
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Log in with email`
  String get logInWithEmail {
    return Intl.message(
      'Log in with email',
      name: 'logInWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Log in with mobile`
  String get logInWithMobile {
    return Intl.message(
      'Log in with mobile',
      name: 'logInWithMobile',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter mobile number`
  String get enterMobileNumber {
    return Intl.message(
      'Enter mobile number',
      name: 'enterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Password must contain 6 - 16 character from: digit, letters, or sysmbols`
  String get passwordValidationMsg {
    return Intl.message(
      'Password must contain 6 - 16 character from: digit, letters, or sysmbols',
      name: 'passwordValidationMsg',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to the `
  String get readAndAgreeMsg {
    return Intl.message(
      'I have read and agree to the ',
      name: 'readAndAgreeMsg',
      desc: '',
      args: [],
    );
  }

  /// `App Account User Agreement `
  String get appAgreement {
    return Intl.message(
      'App Account User Agreement ',
      name: 'appAgreement',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message('and', name: 'and', desc: '', args: []);
  }

  /// `Privacy Notice`
  String get privacyNotice {
    return Intl.message(
      'Privacy Notice',
      name: 'privacyNotice',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `on Boarding Title`
  String get onBoardingTitle {
    return Intl.message(
      'on Boarding Title',
      name: 'onBoardingTitle',
      desc: '',
      args: [],
    );
  }

  /// `on Boarding Description`
  String get onBoardingDescription {
    return Intl.message(
      'on Boarding Description',
      name: 'onBoardingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `New version available`
  String get appUpdateTitle {
    return Intl.message(
      'New version available',
      name: 'appUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please update to the latest version of the app.`
  String get appUpdateSubTitle {
    return Intl.message(
      'Please update to the latest version of the app.',
      name: 'appUpdateSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Optional`
  String get optional {
    return Intl.message('Optional', name: 'optional', desc: '', args: []);
  }

  /// `Exit`
  String get exitText {
    return Intl.message('Exit', name: 'exitText', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Exit App`
  String get exitApp {
    return Intl.message('Exit App', name: 'exitApp', desc: '', args: []);
  }

  /// `Are you sure you want to exit the app ?`
  String get exitDesc {
    return Intl.message(
      'Are you sure you want to exit the app ?',
      name: 'exitDesc',
      desc: '',
      args: [],
    );
  }

  /// `Themes`
  String get themes {
    return Intl.message('Themes', name: 'themes', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Some thing went wrong`
  String get someThingWentWrong {
    return Intl.message(
      'Some thing went wrong',
      name: 'someThingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Search your country`
  String get searchYourCountry {
    return Intl.message(
      'Search your country',
      name: 'searchYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile number`
  String get enterYourMobile {
    return Intl.message(
      'Enter your mobile number',
      name: 'enterYourMobile',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Enter the below details to register`
  String get enterYourBelowDetails {
    return Intl.message(
      'Enter the below details to register',
      name: 'enterYourBelowDetails',
      desc: '',
      args: [],
    );
  }

  /// `Enter username`
  String get enterUserName {
    return Intl.message(
      'Enter username',
      name: 'enterUserName',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message('User name', name: 'userName', desc: '', args: []);
  }

  /// `Enter full name`
  String get enterFullName {
    return Intl.message(
      'Enter full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter password`
  String get reEnterPassword {
    return Intl.message(
      'Re-enter password',
      name: 'reEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid mobile number`
  String get invalidMobileNumber {
    return Intl.message(
      'Invalid mobile number',
      name: 'invalidMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Set Password`
  String get setPassword {
    return Intl.message(
      'Set Password',
      name: 'setPassword',
      desc: '',
      args: [],
    );
  }

  /// `at least 8 characters`
  String get atLeast8Characters {
    return Intl.message(
      'at least 8 characters',
      name: 'atLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `one uppercase letter`
  String get oneUppercaseLetter {
    return Intl.message(
      'one uppercase letter',
      name: 'oneUppercaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `one lowercase letter`
  String get oneLowerCaseLetter {
    return Intl.message(
      'one lowercase letter',
      name: 'oneLowerCaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `one number`
  String get oneNumber {
    return Intl.message('one number', name: 'oneNumber', desc: '', args: []);
  }

  /// `one special character`
  String get oneSpecialCharacter {
    return Intl.message(
      'one special character',
      name: 'oneSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your confirm password`
  String get pleaseEnterCPassword {
    return Intl.message(
      'Please enter your confirm password',
      name: 'pleaseEnterCPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your password and confirmation password must match.`
  String get passwordNotMatch {
    return Intl.message(
      'Your password and confirmation password must match.',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain:`
  String get passwordMustContain {
    return Intl.message(
      'Password must contain:',
      name: 'passwordMustContain',
      desc: '',
      args: [],
    );
  }

  /// `Enter the below details and access\nyour `
  String get enterTheBelowDetails {
    return Intl.message(
      'Enter the below details and access\nyour ',
      name: 'enterTheBelowDetails',
      desc: '',
      args: [],
    );
  }

  /// `Register Now.`
  String get registerNowText {
    return Intl.message(
      'Register Now.',
      name: 'registerNowText',
      desc: '',
      args: [],
    );
  }

  /// `Forgot\nPassword?`
  String get forgotPasswordText {
    return Intl.message(
      'Forgot\nPassword?',
      name: 'forgotPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Worry not we are here to help you\nto reset your password.`
  String get worryNotText {
    return Intl.message(
      'Worry not we are here to help you\nto reset your password.',
      name: 'worryNotText',
      desc: '',
      args: [],
    );
  }

  /// `I remember my password? `
  String get iRememberMyPassword {
    return Intl.message(
      'I remember my password? ',
      name: 'iRememberMyPassword',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Enter the new password and secure\nyour account.`
  String get enterNewPassword {
    return Intl.message(
      'Enter the new password and secure\nyour account.',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset\nPassword`
  String get resetPassword {
    return Intl.message(
      'Reset\nPassword',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Get Verified`
  String get getVerified {
    return Intl.message(
      'Get Verified',
      name: 'getVerified',
      desc: '',
      args: [],
    );
  }

  /// `We've sent verification code on`
  String get weHaveSentCode {
    return Intl.message(
      'We\'ve sent verification code on',
      name: 'weHaveSentCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify Me`
  String get verifyMe {
    return Intl.message('Verify Me', name: 'verifyMe', desc: '', args: []);
  }

  /// `Request new code in  `
  String get requestNewCode {
    return Intl.message(
      'Request new code in  ',
      name: 'requestNewCode',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
