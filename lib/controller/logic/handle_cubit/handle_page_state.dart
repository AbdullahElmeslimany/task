part of 'handle_page_cubit.dart';

@immutable
sealed class HandlePageState {}

final class HandlePageInitial extends HandlePageState {}

final class ChangeLengthState extends HandlePageState {}

final class FirstLengthState extends HandlePageState {}

final class ChangePageState extends HandlePageState {
  final index;
  ChangePageState({required this.index});
}
