import 'package:flutter/material.dart';
import 'package:islami_project/screens/quranScreen/surasInfo.dart';
import 'package:islami_project/screens/quranScreen/widgets/suraItem.dart';
import 'package:islami_project/utils/appColors.dart';
import '../../utils/appStyles.dart';
import 'widgets/recentlyOpenedWidget.dart';
import 'widgets/searchBarWidget.dart';
import 'package:flutter/services.dart' show rootBundle;
class QuranTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        children: [
          SearchBarWidget(),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  child: Text('Most Recently',style: AppStyles.bold16white,),
                )
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RecentlyOpenedWidget(index: index,),
              separatorBuilder: (context, index) => SizedBox(),
              itemCount: 4,
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  child: Text('Suras List',style: AppStyles.bold16white,),
                )
            ),
          ),
          Expanded(
            flex:5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04),
              child: ListView.separated(
                itemBuilder: (context, index) => SuraItem(index: index,),
                separatorBuilder: (context, index) => Divider(
                  indent: width*0.1,
                  endIndent: width*0.1,
                  color: AppColors.whiteColor,
                ),
                itemCount: SurasInfo.englishQuranSurahs.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
