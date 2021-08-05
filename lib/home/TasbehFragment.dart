import 'package:flutter/material.dart';
import 'package:islami_app_mon/main.dart';

class TasbehFragment extends StatefulWidget {
  @override
  _TasbehFragmentState createState() => _TasbehFragmentState();
}

class _TasbehFragmentState extends State<TasbehFragment> {
  List<String> tasbehList = ['سبحان الله', 'الحمدلله', 'الله أكبر'];
  int currentTasbehIndex = 0;
  int tasbeehCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/default_bg.png'))),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.zero,
            child: Image.asset('assets/images/head_of_sebha.png'),
          ),
          RotationTransition(
            turns: AlwaysStoppedAnimation(11 * tasbeehCount / 360),
            child: Container(
              padding: EdgeInsets.all(2),
              child: Image.asset('assets/images/body_of_sebha.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "عدد التسبيحات",
              style: TextStyle(
                  fontSize: 25,
                  color: MyLightThemeData.colorAccent,
                  fontFamily: 'elmessiri_semi_bold'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/tasbeh_count_bg.png')),
            ),
            child: Text(
              '$tasbeehCount',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: MyLightThemeData.colorPrimary,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4)),
            onPressed: () => {onTasbehPressed()},
            child: Text(
              tasbehList[currentTasbehIndex],
              style: TextStyle(fontFamily: 'monotype_koufi_bold', fontSize: 25),
            ),
          )
        ],
      ),
    );
  }

  onTasbehPressed() {
    setState(() {
      tasbeehCount++;
      if (tasbeehCount / 33 >= 1) {
        currentTasbehIndex = (currentTasbehIndex + 1) % 3;
      }
      tasbeehCount = tasbeehCount % 33;
    });
  }
}
