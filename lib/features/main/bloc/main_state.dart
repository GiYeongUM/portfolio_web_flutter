part of 'main_bloc.dart';

@CopyWith()
class MainState extends CommonState {
  const MainState({
    super.status,
    super.errorMessage,
    super.hasReachedMax,
    super.page,
    super.query,
  });

  @override
  List<Object?> get props => [...super.props];
}
