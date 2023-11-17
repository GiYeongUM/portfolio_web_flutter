part of 'main_bloc.dart';

class MainEvent extends CommonEvent {
  const MainEvent();
}

class PageChanged extends MainEvent {
  const PageChanged({this.page = 0});

  final int page;
}
