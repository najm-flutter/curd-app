part of 'them_bloc.dart';

@immutable
sealed class ThemState {}

final class ThemInitial extends ThemState {}
final class LightThemState extends ThemState {
  final ThemeData themeData ;

  LightThemState({required this.themeData});

}
final class DarkThemState extends ThemState {
  final ThemeData themeData ;

  DarkThemState({required this.themeData});
}
