import 'package:flutter/material.dart';
import 'package:islami_project/screens/timeScreen/widgets/azkarItem.dart';
import 'package:islami_project/screens/timeScreen/widgets/timeCarsouel.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';

class TimeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.322,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.prayerTimeContainer),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.015),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '16 Jul,\n2024',
                            style: AppStyles.bold16white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            spacing: 8,
                            children: [
                              Text(
                                'Pray Time',
                                style: AppStyles.bold20blackTransparent,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Tuesday',
                                style: AppStyles.bold20blackTransparent2,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '09 Muh,\n1446',
                            style: AppStyles.bold16white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => TimeCarsouel(index: index),
                    separatorBuilder: (context, index) =>
                        SizedBox(width: width * 0.01),
                    itemCount: 5,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(flex: 3),
                        Text(
                          'Next Pray ',
                          style: AppStyles.bold16blackTransparent,
                        ),
                        Text('- 02:32', style: AppStyles.bold16black),
                        Spacer(flex: 2),
                        Icon(
                          Icons.volume_off_rounded,
                          color: AppColors.blackBg,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Text('Azkar', style: AppStyles.bold16white),
          ),
          Row(
            spacing: width * 0.04,
            children: [
              Expanded(
                child: AzkarItem(
                  name: 'Evening Azkar',
                  image: AppImages.eveningAzkar,
                ),
              ),
              Expanded(
                child: AzkarItem(
                  name: 'Morning Azkar',
                  image: AppImages.morningAzkar,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
