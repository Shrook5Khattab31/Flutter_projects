import 'package:flutter/material.dart';
import 'package:islami_project/screens/quranScreen/widgets/suraItem.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:provider/provider.dart';

import '../../utils/appStyles.dart';
import 'mostRecentProvider.dart';
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
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      mostRecentProvider.readMostRecentList();
    });
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    mostRecentProvider=Provider.of<MostRecentProvider>(context);
    var height =MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        children: [
          SearchBarWidget(onSearch: updateFilterList,),
          SizedBox(height: height*0.018,),
          Visibility(
            visible: mostRecentProvider.mostRecentList.isNotEmpty,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height*0.01),
                    child: Text('Most Recently', style: AppStyles.bold16white),
                  ),
                ),
                SizedBox(
                  height: height*0.16,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => RecentlyOpenedWidget(index: mostRecentProvider.mostRecentList[index]),
                    separatorBuilder: (context, index) => SizedBox(),
                    itemCount: mostRecentProvider.mostRecentList.length,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height*0.01),
              child: Text('Suras List', style: AppStyles.bold16white),
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