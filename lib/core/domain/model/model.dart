import 'package:json_annotation/json_annotation.dart';

import 'exception_model.dart';
import 'meta_model.dart';

part 'generated/model.g.dart';

@JsonSerializable()
class BaseModel {
  final String? code;
  final String? message;

  const BaseModel({this.code, this.message});

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
}

@JsonSerializable()
class Model<T> extends BaseModel {
  @JsonKey(toJson: _dataToJson, fromJson: _dataFromJson)
  final T? data;

  const Model({this.data, super.code, super.message});

  static T? _dataFromJson<T>(dynamic data) {
    if (data == null) return null;
    return switch (T) {
      ExceptionModel => ExceptionModel.fromJson(data),
      bool || int || String => data,
      _ => null,
    } as T;
  }

  static Map<String, dynamic>? _dataToJson<T>(T? data) {
    return switch (T) {
      ExceptionModel => (data as ExceptionModel).toJson(),
      bool || int || String => <String, dynamic>{'data': data},
      _ => null,
    };
  }

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson<T>(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class ListModel<T> {
  @JsonKey(toJson: _listToJson, fromJson: _listFromJson)
  final List<T>? data;
  final Meta? meta;

  const ListModel({this.data, this.meta});

  static T? _listFromJson<T>(List<dynamic> json) {
    if (json.isEmpty) return null;
    return [] as T;
  }

  static List<Map<String, dynamic>?>? _listToJson<T>(T? items) {
    return (items as List)
        .map((element) => switch (element.runtimeType) {
              // Data => (element as Data).toJson(),
              _ => null,
            })
        .toList();
  }

  factory ListModel.fromJson(Map<String, dynamic> json) => _$ListModelFromJson<T>(json);
}
