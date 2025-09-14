import 'package:flutter/material.dart';
import 'package:islami_project/screens/hadithScreen/hadithTab.dart';
import 'package:islami_project/screens/homeScreen/widgets/selectedItemWidget.dart';
import 'package:islami_project/screens/quranScreen/quranTab.dart';
import 'package:islami_project/screens/sebhaScreen/sebhaTab.dart';
import 'package:islami_project/screens/timeScreen/timeTab.dart';
import 'package:islami_project/utils/appImages.dart';

import '../radioScreen/radioTab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> bgImages = [
    AppImages.quranBgImage,AppImages.hadithBgImage,
    AppImages.SebhaBgImage,AppImages.radioBgImage,
    AppImages.timeBgImage,
  ];
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(bgImages[selectedIndex]),fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(AppImages.islamiLogo,height: height*0.18,),
              buildPage(index: selectedIndex),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        items: [
          makeItem(icon: AppImages.quranIcon,label: 'Quran'),
          makeItem(icon: AppImages.hadethIcon,label: 'Hadith'),
          makeItem(icon: AppImages.sebhaIcon, label: 'Sebha'),
          makeItem(icon: AppImages.radioIcon,label: 'Radio'),
          makeItem(icon: AppImages.timeIcon,label: 'Time'),
        ],
      ),
    );
  }

  BottomNavigationBarItem makeItem({String label='',required String icon}){
    return BottomNavigationBarItem(
      activeIcon: SelectedItemWidget(icon: icon,),
      label: label,
      icon: Image.asset(icon),
    );
  }
  Widget buildPage({required int index}){
    switch(index){
      case 0: return QuranTab();
      case 1:return HadithTab();
      case 2: return SebhaTab();
      case 3:return RadioTab();
      case 4:return TimeTab();
      default: return QuranTab();
    }
  }
}
