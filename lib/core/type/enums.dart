import 'package:json_annotation/json_annotation.dart';

enum StatusCode { success, notFound, unAuthorized, badRequest, timeout, forbidden, error, multiple }

enum CommonStatus { initial, ready, success, loading, failure }

enum HoverType { arrow, zoom }

enum StockStatus {
  @JsonValue("재고부족")
  EMPTY,
  @JsonValue("여유")
  FREE,
  @JsonValue("보통")
  NORMAL;

  const StockStatus();

  String get enumToData => switch (this) {
        StockStatus.EMPTY => '매진',
        StockStatus.FREE || StockStatus.NORMAL => '가능',
      };
}
