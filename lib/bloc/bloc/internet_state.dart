part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}
final class InternetConectState extends InternetState {
  final String internetState ;

  InternetConectState({required this.internetState});

}
final class InternetNoConectState extends InternetState {
  final String internetState ;

  InternetNoConectState({required this.internetState});
}
