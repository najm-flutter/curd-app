import 'package:flutter/material.dart';

class MassegeError extends StatelessWidget {
  const MassegeError({super.key, required this.string});
  final String string ;
  @override
  Widget build(BuildContext context){
    return Center( child: Text(string , style: Theme.of(context).textTheme.titleMedium,),);
  }
}