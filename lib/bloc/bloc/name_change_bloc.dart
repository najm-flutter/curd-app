import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'name_change_event.dart';
part 'name_change_state.dart';

class NameChangeBloc extends Bloc<NameChangeEvent, NameChangeState> {
   String name = '';
  NameChangeBloc() : super(NameChangeInitial(name: '')) {
    on<NameChangeEvent>((event, emit) {
      if (event is NameChangeEventInit) {
        emit(NameChangeLoadin ( name: name));
        name = '';
        emit(NameChangeloaded(name:name));
      } else if (event is CraeteNameChangeEvent) {
        emit(NameChangeLoadin(name:name));
        name = 'nagm';
        emit(NameChangeloaded(name:name));
      } else if (event is RestNameChangeEvent) {
        emit(NameChangeLoadin(name:name));
        name = 'nagm';
        emit(NameChangeloaded(name:name));
      } else if (event is ClearNameChangeEvent) {
        emit(NameChangeLoadin(name:name));
        name = '';
        emit(NameChangeloaded(name:name));
      }
    });
  }
}
