import 'package:flutter/material.dart';

void pushView(BuildContext context, dynamic route){
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

void backView(BuildContext context){
  Navigator.pop(context);
}

void pusReplaceView(BuildContext context, dynamic route){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
}