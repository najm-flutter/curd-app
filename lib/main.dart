import 'package:block_test/applocalization.dart';
import 'package:block_test/bloc/bloc/chnge_lang_bloc.dart';
import 'package:block_test/layear/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChngeLangBloc(),
      child: BlocBuilder<ChngeLangBloc, ChngeLangState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state is ChngeLang ? Locale(state.languageCode) : Locale("en"),
            supportedLocales: [Locale('ar'), Locale('en')],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supporte in supportedLocales) {
                if (locale != null) {
                  if (supporte.languageCode == locale.languageCode) {
                    return supporte;
                  }
                }
              }
              return supportedLocales.first;
            },
            localizationsDelegates: [
              Applocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            home: const Home(),
          );
        },
      ),
    );
  }
}
