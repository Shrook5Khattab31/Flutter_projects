import 'package:flutter/material.dart';

import '../../../utils/appColors.dart';
import '../../../utils/appStyles.dart';

class AzkarItem extends StatelessWidget {
  String name;
  String image;

  AzkarItem({required this.name, required this.image});

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
        image: DecorationImage(image: AssetImage(image)),
      ),
      child: Text(name, style: AppStyles.bold20white),
    );
  }
}
