import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'them_event.dart';
part 'them_state.dart';

class ThemBloc extends Bloc<ThemEvent, ThemState> {
  ThemBloc() : super(ThemInitial()) {
    on<ThemEvent>((event, emit) {
    if (event is LightThemEvent) {
      emit(LightThemState(themeData: ThemeData.light())) ;
    } else if (event is DarkThemEvent) {
    emit(DarkThemState(themeData: ThemeData.dark())) ;
    }
    });
  }
}
