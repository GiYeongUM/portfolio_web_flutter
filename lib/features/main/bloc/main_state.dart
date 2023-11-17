part of 'main_bloc.dart';

@CopyWith()
class MainState extends CommonState {
  const MainState({
    super.status,
    super.errorMessage,
    super.hasReachedMax,
    super.page = 0,
    super.query,
  });

  @override
  List<Object?> get props => [...super.props];
}
