import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../core/bloc/common_event.dart';
import '../../../core/bloc/common_state.dart';
import '../../../core/type/enums.dart';

part 'generated/main_bloc.g.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<CommonEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<Initial>(_onInitial);
  }

  _onInitial(Initial event, Emitter<MainState> emit) {}
}
