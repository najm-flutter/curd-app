import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chnge_lang_event.dart';
part 'chnge_lang_state.dart';

class ChngeLangBloc extends Bloc<ChngeLangEvent, ChngeLangState> {
  ChngeLangBloc() : super(ChngeLangInitial()) {
    on<ChngeLangEvent>((event, emit) {
     if (event is ChngeLangEventEn) {
       emit(ChngeLang(languageCode: "en")) ;
     } else {
       emit(ChngeLang(languageCode: "ar")) ;
       
     }
    });
  }
}
