import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/utils/appStyles.dart';

import '../../../utils/appColors.dart';
import '../../../utils/appImages.dart';
import '../../../utils/routeNames.dart';
import 'hadithModel.dart';

class HadithContent extends StatefulWidget {
  int index;
  HadithContent({required this.index});
  @override
  State<HadithContent> createState() => _HadithContentState();
}

class _HadithContentState extends State<HadithContent> {
  HadithModel? hadith;
  @override
  void initState() {
    super.initState();
    loadFile(widget.index);
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RouteNames.hadithDetailsScreen,arguments: hadith);
      },
      child: Container(
        width: width*0.68,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.goldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height*0.012),
              child: Image.asset(AppImages.hadithDecoration,height: double.infinity,fit: BoxFit.fill),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.04, horizontal: width * 0.04),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.01),
                    child: Text(
                      hadith?.title ?? '',
                      style: AppStyles.bold24black,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: hadith == null
                        ? Center(child: CircularProgressIndicator(color: AppColors.blackBg))
                        : ListView.separated(
                      itemBuilder: (context, index) => Text(
                        hadith!.lines[index],
                        style: AppStyles.bold16black,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                      itemCount: hadith!.lines.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> loadFile(int index) async {
    final fileContent = await rootBundle.loadString('assets/files/Hadeeth/h${index + 1}.txt');
    final lines = fileContent.split('\n');
    final title = lines.first;
    final body = lines.sublist(1);
    setState(() {
      hadith = HadithModel(title: title, lines: body, index: index);
    });
  }
}
