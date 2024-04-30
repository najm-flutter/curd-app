part of 'connictivity_bloc.dart';

@immutable
sealed class ConnictivityState {}

final class ConnictivityInitial extends ConnictivityState {}

final class OnlineConnictivityState extends ConnictivityState {
  final String string;

  OnlineConnictivityState({required this.string});
}

final class OfflineConnictivityState extends ConnictivityState {
  final String string;

  OfflineConnictivityState({required this.string});
}
