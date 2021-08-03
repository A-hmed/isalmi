import 'package:flutter/material.dart';
import 'package:islami_app_mon/home/HadethFragment.dart';
import 'package:islami_app_mon/home/QuranFragment.dart';
import 'package:islami_app_mon/home/RadioFragment.dart';
import 'package:islami_app_mon/home/TasbehFragment.dart';
import 'package:islami_app_mon/main.dart';

class HomeScreen extends StatefulWidget{

  static final ROUTE_NAME = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/default_bg.png')
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor:MyThemeData.colorPrimary),
            child: BottomNavigationBar(
              onTap: onBottomNavigationItemClick,
              currentIndex: selectedIndex,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: MyThemeData.colorAccent,
              selectedIconTheme: IconThemeData(
                  size: 36,
                  color:MyThemeData.colorAccent
              ),
              unselectedItemColor: Colors.white,
              backgroundColor: MyThemeData.colorPrimary,
              items: [
                BottomNavigationBarItem(icon:ImageIcon(
                  AssetImage('assets/images/ic_quran.png'),
                ),
                  label: 'Quran'
                ),BottomNavigationBarItem(icon:ImageIcon(
                  AssetImage('assets/images/ic_hadeth.png'),
                ),
                  label: 'Hadeth'
                ),BottomNavigationBarItem(icon:ImageIcon(
                  AssetImage('assets/images/ic_sebha.png'),
                ),
                  label: 'Sebha'
                ),BottomNavigationBarItem(icon:ImageIcon(
                  AssetImage('assets/images/ic_radio.png'),
                ),
                  label: 'Radio'
                ),
              ],
            ),
          ),
          appBar: AppBar(title: Text('Islami',style: TextStyle(color: MyThemeData.colorAccent),),
          backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: getMainView(),
        ),
      ),
    );
  }
  Widget getMainView(){
    if(selectedIndex==0){
      return QuranFragment();
    }else if(selectedIndex==1){
      return HadethFragment();
    }else if(selectedIndex==2){
      return TasbehFragment();
    }else if(selectedIndex==3){
      return RadioFragment();
    }
  }
  void onBottomNavigationItemClick(int pos){
    setState(() {
      selectedIndex =pos;
    });
  }
}
