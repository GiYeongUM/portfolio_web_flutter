import 'package:json_annotation/json_annotation.dart';

part 'generated/meta_model.g.dart';

@JsonSerializable()
class Meta {
  final int? totalItems;
  final int? itemCount;
  final int? itemsPerPage;
  final int? totalPages;
  final int? currentPage;

  const Meta({this.totalItems, this.itemCount, this.itemsPerPage, this.totalPages, this.currentPage});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
