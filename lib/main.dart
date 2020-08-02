import 'package:covid/choose.dart';
import 'package:covid/info.dart';
import 'package:covid/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main()=>runApp(MaterialApp(

initialRoute: '/',

routes: {

    '/info':(context)=>Info(),
    '/':(context)=>Choose(),
    '/loading':(context)=>Loading(),
    '/info':(context)=>Info(),
   

},


));