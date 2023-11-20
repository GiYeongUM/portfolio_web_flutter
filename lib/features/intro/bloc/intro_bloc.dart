import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../core/core.dart';

part 'generated/intro_bloc.g.dart';
part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<CommonEvent, IntroState> {
  IntroBloc() : super(const IntroState()) {
    on<Initial>(_onInitial);
    on<PageChanged>(_onPageChanged);
  }

  _onInitial(Initial event, Emitter<IntroState> emit) {}

  _onPageChanged(event, Emitter<IntroState> emit) {
    emit(state.copyWith(page: event.page));
  }
}
