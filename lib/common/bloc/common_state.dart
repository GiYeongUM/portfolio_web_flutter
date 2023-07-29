import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../model/meta_model.dart';
import '../enum/enums.dart';

part 'generated/common_state.g.dart';

@CopyWith()
class CommonState extends Equatable {
  const CommonState({
    this.status = CommonStatus.initial,
    this.errorMessage = '오류가 발생하였습니다.',
    this.page = 1,
    this.query,
    this.meta,
    this.filterType = FilterType.none,
    this.orderType = FilterType.createdAt,
    this.hasReachedMax = false,
  });

  final CommonStatus status;
  final String? errorMessage;
  final int page;
  final String? query;
  final Meta? meta;
  final FilterType filterType;
  final FilterType orderType;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [status, errorMessage, page, query, meta, filterType, orderType];
}
