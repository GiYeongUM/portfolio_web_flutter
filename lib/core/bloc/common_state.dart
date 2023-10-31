import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../type/enums.dart';

part 'generated/common_state.g.dart';

@CopyWith()
class CommonState extends Equatable {
  const CommonState({
    this.status = CommonStatus.initial,
    this.errorMessage = '오류가 발생하였습니다.',
    this.page = 1,
    this.query,
    this.hasReachedMax = false,
  });

  final CommonStatus status;
  final String? errorMessage;
  final int page;
  final String? query;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [status, errorMessage, page, query];
}
