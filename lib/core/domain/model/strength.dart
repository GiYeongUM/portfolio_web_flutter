import 'package:equatable/equatable.dart';

class Strength extends Equatable {
  const Strength({this.imageUrl, this.title, this.description});

  final String? imageUrl;
  final String? title;
  final String? description;

  @override
  List<Object?> get props => [];
}
