import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'connictivity_event.dart';
part 'connictivity_state.dart';

class ConnictivityBloc extends Bloc<ConnictivityEvent, ConnictivityState> {
  StreamSubscription? streamSubscription;
  ConnictivityBloc() : super(ConnictivityInitial()) {
    on<ConnictivityEvent>((event, emit) {});
    on<OnlineConnictivityEvent>((event, emit) {
      emit(OnlineConnictivityState(string: "online"));
    });
    on<OfflineConnictivityEvent>((event, emit) {
      emit(OfflineConnictivityState(string: "offline"));
    });
    streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      if (!kIsWeb) {
        if (event.contains(ConnectivityResult.wifi)) {
          add(OnlineConnictivityEvent()) ;
        } else {
          add(OfflineConnictivityEvent()) ;
        }
      } else {
        add(OnlineConnictivityEvent()) ;
      }
    });
  }
}
