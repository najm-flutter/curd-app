part of 'name_change_bloc.dart';

@immutable
sealed class NameChangeState {}

final class NameChangeInitial extends NameChangeState {
 final String? name;
  NameChangeInitial({required this.name});
}

final class NameChangeLoadin extends NameChangeState {
  final String? name;
  NameChangeLoadin({required this.name});
}

final class NameChangeloaded extends NameChangeState {
  final String? name;
  NameChangeloaded({required this.name});
}

final class NameChangeError extends NameChangeState {
  final String? name;
  NameChangeError({required this.name});
}
