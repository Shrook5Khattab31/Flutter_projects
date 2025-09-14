import 'package:flutter/material.dart';

import '../../../utils/appColors.dart';
import '../../../utils/appImages.dart';
import '../../../utils/appStyles.dart';

class AzkarItem extends StatelessWidget {
  int index;
  AzkarItem({required this.index});
  var azkarList = [
    {'name': 'Evening Azkar', 'image': AppImages.eveningAzkar},
    {'name': 'Morning Azkar', 'image': AppImages.morningAzkar},
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.27,
      width: width * 0.43,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: AppColors.blackBg,
        borderRadius: BorderRadius.circular(20),
        border: BoxBorder.all(color: AppColors.goldColor),
        image: DecorationImage(image: AssetImage(azkarList[index]['image']!)),
      ),
      child: Text(azkarList[index]['name']!, style: AppStyles.bold20white),
    );
  }
}
