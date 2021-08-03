import 'package:flutter/material.dart';
import 'package:islami_app_mon/home/widgets/SuraNameWidget.dart';
import 'package:islami_app_mon/main.dart';

class QuranFragment extends StatelessWidget {

  List<String>names = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Center(
                child: Image.asset('assets/images/quran_screen_logo.png'))),
        SizedBox(height: 8,),
        Expanded(flex: 3, child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(child:
            Text('Sura Name',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border:Border.all(color: Theme.of(context).primaryColor,width: 2)
              )
              ,
            ),
            Expanded(child:ListView.separated(itemBuilder: (context,index){
              return SuraNameWidget(names[index],index+1);
            },
            itemCount: names.length,
              separatorBuilder: (context,index){
              return Container(height: 1,color: Theme.of(context).primaryColor,
              margin: EdgeInsets.symmetric(horizontal: 12),
              );
              },
            )
            )
          ],
        )),
      ],
    );
  }
}
