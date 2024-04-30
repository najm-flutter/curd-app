import 'package:flutter/material.dart';

class SnackMessage {
  void doneSnackMessage(BuildContext context ,String message){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Text(message ,)));
  }
  void errorSnackMessage(BuildContext context ,String message){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar( 
      backgroundColor: Colors.red,
      content: Text(message)));
  }
}