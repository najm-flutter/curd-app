part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {
   final ThemeData themeData ;
  ThemeInitial({required this.themeData});
}
final class LightThemeState extends ThemeState {
  final ThemeData themeData ;
  LightThemeState({required this.themeData});
}
final class DarkThemeState extends ThemeState {
  final ThemeData themeData ;
  DarkThemeState({required this.themeData});
}
