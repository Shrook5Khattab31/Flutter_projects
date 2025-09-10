import 'package:flutter/material.dart';
import 'package:islami_project/utils/appStyles.dart';

import '../../../utils/appColors.dart';

class TimeCarsouel extends StatelessWidget {
  int index;

  TimeCarsouel({required this.index});

  final List<String> prayerNames = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
  final List<String> prayerTimes = [
    '04:04 ',
    '01:01 ',
    '04:38 ',
    '07:57 ',
    '09:28 ',
  ];
  final List<String> pmOrAm = ['AM', 'PM', 'PM', 'PM', 'PM'];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.13,
      width: width * 0.24,
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.blackBg,
            AppColors.blackTransparentColor,
            AppColors.goldColor,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(prayerNames[index], style: AppStyles.bold14white),
          Text(prayerTimes[index], style: AppStyles.bold24white),
          Text(pmOrAm[index], style: AppStyles.bold14white),
        ],
      ),
    );
  }
}
