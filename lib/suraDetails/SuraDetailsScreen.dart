import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_mon/suraDetails/AyaItem.dart';
import '../main.dart';

class SuraDetailsScreen extends StatefulWidget{
  static final String ROUTE_NAME = 'sura_details';

  @override
  _SuraDetailsScreenState createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {

  @override
  Widget build(BuildContext context) {
   var args =  ModalRoute.of(context).settings.arguments as SuraDetailsArgs;
   readSuraContent('assets/content/${args.filePos}.txt');
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/default_bg.png')
            )
        ),
      child: Scaffold(
          appBar: AppBar(title: Text(args.suraName,style: TextStyle(color: MyLightThemeData.colorAccent),),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Theme.of(context).accentColor
            ),
          ),
          backgroundColor: Colors.transparent,
          body:getMainView()
      ),
    );
  }

  Widget getMainView(){
    return Container(
      child:
      ayatList.length==0 ?
      Center(child: CircularProgressIndicator())
          :
      Container(
        margin: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: Color.fromRGBO(254, 254, 254, .7),
          borderRadius: BorderRadius.circular(8)
        ),
        child: ListView.separated(itemBuilder: (context,index){
          return AyaWidget(ayatList[index],index+1);
        },
          itemCount: ayatList.length,
          separatorBuilder: (context,index){
            return Container(height: 1,color: Theme.of(context).primaryColor,
              margin: EdgeInsets.symmetric(horizontal: 12),
            );
          },
        ),
      )

      ,
    );
  }
  List<String> ayatList = [];

  void readSuraContent(String fileName)async{
    // Future => async programming
   String fileContent =   await rootBundle.loadString(fileName);
   List<String> lines = fileContent.split('\n');
   setState(() {
     ayatList = lines;
   });

  }
}

class SuraDetailsArgs {
  int filePos;
  String suraName;

  SuraDetailsArgs({this.filePos,this.suraName});
}