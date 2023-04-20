// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatelessWidget {
 Screen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.redAccent[400],
    ));
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
      ),
      home: Scaffold(
          backgroundColor:Colors.redAccent[400],
          appBar: AppBar(
              backgroundColor:Colors.redAccent[400],
              elevation: 0,
              title: Container(),),
          body:
      Column(children: [ Container(
        alignment: Alignment.center,
        child:Text('Scoreboard') ,),
          
      SizedBox(height: 80,),
     Row  (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [  Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
            SizedBox(width: 5,),
            Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
             SizedBox(width: 5,),
            Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
       ]) ,
       SizedBox(height: 10,),
       Row  (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [  Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
            SizedBox(width: 5,),
            Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
             SizedBox(width: 5,),
            Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
       ]),
       SizedBox(height: 10,),
       Row  (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [  Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
            SizedBox(width: 5,),
            Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
             SizedBox(width: 5,),
            Container(
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color: Colors.amberAccent),height: 100,width:100 ,
            child:Container() ,),
       ]),
       SizedBox(height: 10,),
       Text('Timer')
        ]) ),
    );
  }
}
    
    
    
              