import 'package:flutter/material.dart';
import 'package:islami_project/screens/hadithScreen/widgets/hadithModel.dart';

import '../../utils/appColors.dart';
import '../../utils/appImages.dart';
import '../../utils/appStyles.dart';

class HadithDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HadithModel hadith = ModalRoute.of(context)!.settings.arguments as HadithModel;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: AppColors.goldColor),
        ),
        title: Text(
          'Hadith ${hadith.index + 1}',
          style: AppStyles.bold20gold,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.blackBg,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.suraDecoration),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.046),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: height * 0.04),
                child: Text(hadith.title,
                  style: AppStyles.bold24gold,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Text(hadith.lines[index],
                    style: AppStyles.bold20gold,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: hadith.lines.length,
                ),
              ),
              SizedBox(height: height*0.13,),
            ],
          ),
        ),
      ),
    );
  }
}
