part of 'them_bloc.dart';

@immutable
sealed class ThemEvent {}
class LightThemEvent extends ThemEvent {
  
}
class DarkThemEvent extends ThemEvent {
  
}
