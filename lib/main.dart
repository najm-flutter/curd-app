import 'package:block_test/bloc/bloc/bloc/them_bloc.dart';
import 'package:block_test/layear/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemBloc(),
      child: BlocBuilder<ThemBloc, ThemState>(
        builder: (context, state) {
          return MaterialApp(
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
            
            ],
            title: 'Flutter Demo',
            theme: state is LightThemState
                ? state.themeData
                : state is DarkThemState
                    ? state.themeData
                    : ThemeData.light(),
            home: const Home(),
          );
        },
      ),
    );
  }
}
