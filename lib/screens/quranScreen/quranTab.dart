import 'package:flutter/material.dart';
import 'package:islami_project/screens/quranScreen/widgets/suraItem.dart';
import 'package:islami_project/utils/appColors.dart';

import '../../utils/appStyles.dart';
import 'widgets/recentlyOpenedWidget.dart';
import 'widgets/searchBarWidget.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    filterList = List.generate(114, (index) => index);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        children: [
          SearchBarWidget(onSearch: updateFilterList,),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text('Most Recently', style: AppStyles.bold16white),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RecentlyOpenedWidget(index: index),
              separatorBuilder: (context, index) => SizedBox(),
              itemCount: 4,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text('Suras List', style: AppStyles.bold16white),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: ListView.separated(
                itemBuilder: (context, index) => SuraItem(index: filterList[index]),
                separatorBuilder: (context, index) => Divider(
                  indent: width * 0.1,
                  endIndent: width * 0.1,
                  color: AppColors.whiteColor,
                ),
                itemCount: filterList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void updateFilterList(List<int> newList) {
    setState(() {
      filterList = newList;
    });
  }
}