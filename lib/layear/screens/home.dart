import 'package:block_test/bloc/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetConectState) {
            print("object") ;
                return Center(
            child: Text(
                    state.internetState),
          );
          }else if (state is InternetNoConectState) {
            print("objectfgkflkg") ;
                return Center(
            child: Text(
                    state.internetState),
          );
          }
          print("objectfgkflkgdifoidfoid") ;
          return Center(
            child: Text(""),
          );
        },
      ),
    );
  }
}
