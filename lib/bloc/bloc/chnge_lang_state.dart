part of 'chnge_lang_bloc.dart';

@immutable
sealed class ChngeLangState {}

final class ChngeLangInitial extends ChngeLangState {}
final class ChngeLang extends ChngeLangState {
   final String languageCode ;

  ChngeLang({required this.languageCode}); 
}
