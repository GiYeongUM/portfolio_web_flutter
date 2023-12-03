import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Strength extends Equatable {
  const Strength({this.imageUrl, this.title, this.description});

  final String? imageUrl;
  final String? title;
  final String? description;

  @override
  List<Object?> get props => [];

}
