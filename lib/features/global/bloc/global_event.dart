part of 'global_bloc.dart';

class GlobalEvent extends CommonEvent {
  const GlobalEvent();
}

class SetLocale extends GlobalEvent {
  const SetLocale({this.locale});

  final Locale? locale;
}
