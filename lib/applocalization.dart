import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Applocalization {
  Locale? locale ;
  Applocalization({this.locale}) ;

  static Applocalization? of(BuildContext context) {
    return Localizations.of<Applocalization>(context , Applocalization) ;
  }
  static LocalizationsDelegate<Applocalization> delegate = ApplocalizationDelegate() ;
  late Map<String , String> jsonString  ;
  Future loadlang ()async {
    String string  = await rootBundle.loadString('assets/${locale!.languageCode}.json') ;
    Map<String , dynamic> jsonDynmec = jsonDecode(string) ;
    jsonString = jsonDynmec.map((key, value) => MapEntry(key, value.toString())) ;
  }
   String translate(String key)=> jsonString[key]?? "" ; 
}
class ApplocalizationDelegate extends LocalizationsDelegate<Applocalization> {
  @override
  bool isSupported(Locale locale) {
   return ["ar" , "en"].contains(locale.languageCode) ;
  }

  @override
  Future<Applocalization> load(Locale locale) async {
  Applocalization applocalization =  Applocalization(locale: locale) ;
  await applocalization.loadlang() ;
  return applocalization ;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Applocalization> old)=> false ;
  
}