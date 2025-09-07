import 'package:flutter/material.dart';
import 'package:islami_project/screens/quranScreen/surasInfo.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';

class RecentlyOpenedWidget extends StatelessWidget {
  int index;
  RecentlyOpenedWidget({required this.index});
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: width*0.04,),
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 17),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(SurasInfo.englishQuranSurahs[index],style: AppStyles.bold24black,),
                Text(SurasInfo.arabicAuranSuras[index],style: AppStyles.bold24black,),
                Text('${SurasInfo.AyaNumber[index]} verses',style: AppStyles.bold14black,),
              ],
            ),
            Image.asset(AppImages.mostRecentImage,fit: BoxFit.fill,),
          ],
        ),
      ),
    );
  }
}
