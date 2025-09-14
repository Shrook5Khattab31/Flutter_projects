import 'package:flutter/material.dart';
import 'package:islami_project/screens/quranScreen/sharedPrefs.dart';
import 'package:islami_project/screens/quranScreen/surasInfo.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';
import 'package:islami_project/utils/routeNames.dart';

class RecentlyOpenedWidget extends StatelessWidget {
  int index;

  RecentlyOpenedWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        SharedPrefs.saveLastSuraIndex(index);
        Navigator.pushNamed(context, RouteNames.suraDetailsScreen,arguments: index);
      },
      child: Container(
        margin: EdgeInsets.only(left: width*0.04,),
        decoration: BoxDecoration(
          color: AppColors.goldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: width*0.039,right: width*0.02,
              top: height*0.007,bottom: height*0.007),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: height*0.012,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(SurasInfo.englishQuranSurahs[index],style: AppStyles.bold24black,),
                    Text(SurasInfo.arabicAuranSuras[index],style: AppStyles.bold24black,),
                    SizedBox(height: height*0.02,),
                    Text('${SurasInfo.AyaNumber[index]} verses',style: AppStyles.bold14black,),
                  ],
                ),
              ),
              Image.asset(AppImages.mostRecentImage,fit: BoxFit.fill,),
            ],
          ),
        ),
      ),
    );
  }
}