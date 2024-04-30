part of 'connictivity_bloc.dart';

@immutable
sealed class ConnictivityEvent {}

class OfflineConnictivityEvent extends ConnictivityEvent{}
class OnlineConnictivityEvent extends ConnictivityEvent{}
