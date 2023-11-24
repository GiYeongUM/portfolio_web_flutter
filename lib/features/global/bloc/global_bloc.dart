import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:intl/intl_browser.dart';

import '../../../core/core.dart';

part 'generated/global_bloc.g.dart';
part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<CommonEvent, GlobalState> {
  GlobalBloc() : super(const GlobalState()) {
    on<Initial>(_onInitial);
    on<SetLocale>(_onSetLocale);
  }

  _onInitial(Initial event, Emitter<GlobalState> emit) async {
    await findSystemLocale().then((value) {
      final locale = value.split('_').first;
      emit(state.copyWith(locale: Locale(locale)));
    });
  }

  _onSetLocale(SetLocale event, Emitter<GlobalState> emit) {
    emit(state.copyWith(locale: event.locale));
  }
}
