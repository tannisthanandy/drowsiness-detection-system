import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audioplayers.dart';






class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {

  DatabaseReference? _ref;
  String database = "";


  static  AudioCache player  = new AudioCache();
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference();


    _ref?.child("Driver").child("Status")
        .onValue.listen((event) {

      print("read once-" + event.snapshot.toString());
         if(event.snapshot.value.length==8) {

           setState(() async {


             const alarmAudioPath = "alarm.mp3";
             await player.play(alarmAudioPath);

           });


         }

    });
  }



  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text('DrowsinessAlerter')),


        ),
      body:Container(
        padding: EdgeInsets.fromLTRB(150,650,150,40),
        height: 750,
        width: 400,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/giphy.gif"),fit: BoxFit.cover)
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red
          ),
          onPressed: () {
            _reset();


          },
          child: Text('reset'),
        )
      )

    );
  }
  _reset(){
    _ref?.child("Driver").remove();
  }
}

