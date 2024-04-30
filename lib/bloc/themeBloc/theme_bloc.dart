import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(themeData: ThemeData.light())) {
    on<LightThemeEvent>((event, emit) {
      emit(LightThemeState(themeData: ThemeData.light()));
    });
    on<DarkThemeEvent>((event, emit) {
      emit(DarkThemeState(themeData: ThemeData.dark()));
    });
  }
}
