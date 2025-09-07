import 'package:flutter/material.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';
import 'package:islami_project/utils/routeNames.dart';
import '../surasInfo.dart';

class SuraItem extends StatelessWidget {
  int index;
  SuraItem({required this.index});
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              height: 52,
              width: 52,
              margin: EdgeInsets.only(right: height*0.02),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.suraIcon)
                ),
              ),
              child: Center(child: Text('${index+1}',style: AppStyles.bold20white,)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(SurasInfo.englishQuranSurahs[index],
                  style: AppStyles.bold20white,
                ),
                Text(SurasInfo.AyaNumber[index],
                  style: AppStyles.bold14white,
                ),
              ],
            ),
            Spacer(),
            Text(SurasInfo.arabicAuranSuras[index],
              style: AppStyles.bold20white,
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.pushNamed(context, RouteNames.suraDetailsScreen, arguments: index);
      },
    );
  }
}
