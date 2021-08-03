import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app_mon/home/widgets/RadioItemWidget.dart';
import 'package:islami_app_mon/model/RadioResponse.dart';

class RadioFragment extends StatefulWidget {
  @override
  _RadioFragmentState createState() => _RadioFragmentState();
}

class _RadioFragmentState extends State<RadioFragment> {
  // show loading
 //1 call api
  //response sataus==200(show default design )
  // show retry icon
  // response
  Future<RadioResponse> radiosResponse;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    radiosResponse=getRadios();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>(
      future:radiosResponse ,
      builder: (buildContext,snapShot){
      if(snapShot.hasData){
        snapShot.data.radios.forEach((item){
          print(item.name);
        });
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  child: Image(image:AssetImage('assets/images/radio.png'))),
            ),
            Expanded(
                flex: 1,
                child:
            ListView.builder(itemBuilder: (buildContext,index){

              return RadioItemWidget(item: snapShot.data.radios[index],);
            },
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
            )

            )

          ],
        );
      }else if (snapShot.hasError){
        return Text('error is ${snapShot.error.toString()}');
      }else{
        return Center(child:CircularProgressIndicator());
      }
      return Text('r');
    },);

  }
   Future<RadioResponse> getRadios()async{
    http.Response response=  await http.get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
      utf8.decode(response.bodyBytes);

    if(response.statusCode==200){
      RadioResponse radiosResponse=RadioResponse.fromJsonMap(jsonDecode( utf8.decode(response.bodyBytes))) ;
      return radiosResponse;
    }else {
          throw(new Exception(response.body));
    }
  }


}
class A{
  Function builder;
  A({this.builder});
  void plus(){

  }
}
