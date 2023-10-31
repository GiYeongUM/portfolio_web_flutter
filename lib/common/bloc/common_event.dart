import 'package:equatable/equatable.dart';

abstract class CommonEvent<T> extends Equatable {
  const CommonEvent();

  @override
  List<Object> get props => [];
}

class Initial<T> extends CommonEvent<T> {
  const Initial({this.id = ''});

  final String id;
}

class Detail<T> extends CommonEvent<T> {
  const Detail({this.id = ''});

  final String id;
}

class Add<T> extends CommonEvent<T> {
  const Add({required this.data, this.id});

  final String? id;

  final Map<String, dynamic> data;
}

class Edit<T> extends CommonEvent<T> {
  const Edit(this.id, this.data);

  final String id;
  final Map<String, dynamic> data;
}

class Delete<T> extends CommonEvent {
  const Delete(this.id);

  final String id;
}

class Paginate<T> extends CommonEvent<T> {
  const Paginate({this.page, this.query});

  final int? page;
  final String? query;
}

class Search<T> extends CommonEvent<T> {
  const Search({this.id = '', this.query = ''});

  final String id;
  final String query;
}

class ChangeIndex<T> extends CommonEvent<T> {
  const ChangeIndex(this.index);

  final int index;
}
