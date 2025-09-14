import 'package:carousel_slider/carousel_slider.dart';
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
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
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
                    Padding(
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
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.015),
                        child: CarouselSlider.builder(
                          itemCount: 5,
                          itemBuilder: (context, index, realIndex) =>
                              TimeCarsouel(index: index),
                          options: CarouselOptions(
                            height: double.infinity,
                            viewportFraction: 0.26,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
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
              SizedBox(
                height: height * 0.3,
                child: GridView.builder(
                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: width * 0.04,
                    mainAxisSpacing: width * 0.04,
                    childAspectRatio: 3/4,
                  ),
                  itemBuilder: (context, index) => AzkarItem(index: index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}