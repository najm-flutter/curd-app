part of 'internet_bloc.dart';

@immutable
sealed class InternetEvent {}
class InternetConectEvent extends InternetEvent{}
class InternetNoConectEvent extends InternetEvent{}
