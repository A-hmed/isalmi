import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_mon/main.dart';
import 'package:islami_app_mon/model/radios.dart';
class RadioItemWidget extends StatefulWidget {
  Radios item;
   RadioItemWidget({this.item});

  @override
  _RadioItemWidgetState createState() => _RadioItemWidgetState();
}

class _RadioItemWidgetState extends State<RadioItemWidget> {
  AudioPlayer audioPlayer ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer= AudioPlayer();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
     width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
   children:[
       Container(
           margin: EdgeInsets.only(bottom: 40),
           child: Text(widget.item.name)),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           IconButton(icon: Icon(Icons.play_arrow,size: 50,color: MyThemeData.colorPrimary,), onPressed:play),
        //   SizedBox(width: 15,),
           IconButton(icon: Icon(Icons.stop,size: 50,color: MyThemeData.colorPrimary,), onPressed:stop)
         ],
       )
   ]
      ),
    );
  }

    play() async {
      await audioPlayer.play(widget.item.radio_url);
  }

  stop()async{
   await audioPlayer.pause();
  }
}
