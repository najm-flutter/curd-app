import 'package:block_test/applocalization.dart';
import 'package:block_test/bloc/bloc/chnge_lang_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(Applocalization.of(context)!.translate('home')) ,
        ElevatedButton(onPressed: ()=> BlocProvider.of<ChngeLangBloc>(context).add(ChngeLangEventEn()), child: const Text("en")) ,
        ElevatedButton(onPressed: ()=> BlocProvider.of<ChngeLangBloc>(context).add(ChngeLangEventAr()), child: const Text("ar")) ,
      ],)  ,
    );
  }
}
