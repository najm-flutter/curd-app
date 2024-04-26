import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(onPressed: ()=> {}, child: Text("show")) ,
        ElevatedButton(onPressed: ()=> {}, child: Text("show")) ,
      ],)  ,
    );
  }
}
