import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? streamSubscription ;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
     if (event is InternetConectEvent) {
       emit(InternetConectState(internetState: "internet conicting")) ;
     } else if (event is InternetNoConectEvent) {
       emit(InternetNoConectState(internetState: "internet Not conicting")) ;
     }
    });
    streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      if  ( event.contains(ConnectivityResult.wifi)   ) {
        add(InternetConectEvent());
      } else {
        add(InternetNoConectEvent());
      }
    }) ;

  }
  @override
  Future<void> close() {
    streamSubscription!.cancel() ;
    return super.close();
  }
}
