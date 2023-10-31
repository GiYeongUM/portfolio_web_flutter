import 'package:equatable/equatable.dart';

abstract class CommonEvent<T> extends Equatable {
  const CommonEvent();

  @override
  List<Object> get props => [];
}

class Initial<T> extends CommonEvent<T> {
  const Initial();
}

class Detail<T> extends CommonEvent<T> {
  const Detail({this.id = ''});

  final String id;
}

class Add<T> extends CommonEvent<T> {
  const Add({this.data});

  final Map<String, dynamic>? data;
}

class Edit<T> extends CommonEvent<T> {
  const Edit({this.id, this.data});

  final String? id;
  final Map<String, dynamic>? data;
}

class Submit<T> extends CommonEvent<T> {
  const Submit({this.data});

  final Map<String, dynamic>? data;
}

class Delete<T> extends CommonEvent {
  const Delete({this.id});

  final String? id;
}

class PageNate<T> extends CommonEvent<T> {
  const PageNate({this.page, this.query});

  final int? page;
  final String? query;
}

class Search<T> extends CommonEvent<T> {
  const Search({this.id = '', this.query = ''});

  final String id;
  final String query;
}

class Error<T> extends CommonEvent<T> {
  const Error(this.exception);

  final Exception exception;
}
