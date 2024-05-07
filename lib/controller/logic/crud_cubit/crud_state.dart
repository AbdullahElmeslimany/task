part of 'crud_cubit.dart';

@immutable
sealed class CrudState {}

final class CrudInitial extends CrudState {}

final class CreateState extends CrudState {}

final class LoadingState extends CrudState {}

final class ReadState extends CrudState {}

final class UpdateState extends CrudState {}

final class DeleteState extends CrudState {}
