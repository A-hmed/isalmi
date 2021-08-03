import 'package:flutter/material.dart';

class AyaWidget extends StatelessWidget{
  String aya;
  int pos;
  AyaWidget(this.aya,this.pos);
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          aya+' ($pos)',style: TextStyle(fontSize: 24,),textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}