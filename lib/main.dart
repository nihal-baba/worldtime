
import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/chooseloc.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/homeloc.dart';
void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
      '/':(context)=>load(),
      '/home':(context)=>Home(),
    '/location':(context)=>chooseloc(),
      '/homeloc':(context)=>homeloc()},
  )
  );
}


