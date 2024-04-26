import 'package:block_test/bloc/bloc/bloc/them_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(onPressed: ()=> BlocProvider.of<ThemBloc>(context).add(LightThemEvent()), child: const Text("show")) ,
        ElevatedButton(onPressed: ()=> BlocProvider.of<ThemBloc>(context).add(DarkThemEvent()), child: const Text("dark")) ,
      ],)  ,
    );
  }
}
