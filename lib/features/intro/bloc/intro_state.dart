part of 'intro_bloc.dart';

@CopyWith()
class IntroState extends CommonState {
  const IntroState({
    super.status,
    super.errorMessage,
    super.hasReachedMax,
    super.page = 0,
    super.query,
    this.item,
  });

  final SkillItem? item;

  @override
  List<Object?> get props => [...super.props, item];
}
