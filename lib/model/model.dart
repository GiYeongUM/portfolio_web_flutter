import 'package:json_annotation/json_annotation.dart';

import 'meta_model.dart';
import 'secure_model.dart';

part 'generated/model.g.dart';

@JsonSerializable()
class BaseModel {
  final int? statusCode;
  final String? message;

  const BaseModel({this.statusCode, this.message});

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
}

@JsonSerializable()
class Model<T> extends BaseModel {
  @JsonKey(toJson: _dataToJson, fromJson: _dataFromJson)
  final T? data;

  const Model({this.data, super.statusCode, super.message});

  static T? _dataFromJson<T>(dynamic data) {
    if (data == null) return null;
    return switch (T) {
      SecureModel => SecureModel.fromJson(data),
      bool || int || String => data,
      Type() => null,
    } as T;
  }

  static Map<String, dynamic>? _dataToJson<T>(T? data) {
    return switch (T) {
      SecureModel => (data as SecureModel).toJson(),
      bool || int || String => <String, dynamic>{'data': data},
      Type() => null,
    };
  }

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson<T>(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class ListModel<T> extends BaseModel {
  final Items<T>? data;

  const ListModel({this.data, super.statusCode, super.message});

  factory ListModel.fromJson(Map<String, dynamic> json) => _$ListModelFromJson<T>(json);
}

@JsonSerializable()
class Items<T> {
  @JsonKey(toJson: _listToJson, fromJson: _listFromJson)
  final List<T>? items;
  final Meta? meta;

  const Items({this.items, this.meta});

  static T? _listFromJson<T>(List<dynamic> json) {
    if (json.isEmpty) return null;

    return [] as T;
  }

  static List<Map<String, dynamic>?>? _listToJson<T>(T? items) {
    return [];
  }

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson<T>(json);
}
