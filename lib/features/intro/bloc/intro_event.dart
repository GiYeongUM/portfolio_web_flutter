part of 'intro_bloc.dart';

class IntroEvent extends CommonEvent {
  const IntroEvent();
}

class PageChanged extends IntroEvent {
  const PageChanged({this.page = 0});

  final int page;
}

class Done extends IntroEvent {
  const Done();
}
