part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}
 class LightThemeEvent extends ThemeEvent {}
 class DarkThemeEvent extends ThemeEvent{}
