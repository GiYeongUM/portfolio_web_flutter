part of 'global_bloc.dart';

@CopyWith()
class GlobalState extends CommonState {
  const GlobalState({
    super.status,
    super.errorMessage,
    super.hasReachedMax,
    super.page,
    super.query,
    this.locale = const Locale('en'),
  });

  final Locale locale;

  @override
  List<Object?> get props => [...super.props, locale];
}
