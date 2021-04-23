import 'package:flutter/material.dart';
double baseHeight = 640.0;
double screenAwaresize( final _size, BuildContext context){
  return _size * MediaQuery.of(context).size.height / baseHeight;
}