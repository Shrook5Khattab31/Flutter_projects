import 'package:flutter/material.dart';
import '../../../utils/appColors.dart';

class SelectedItemWidget extends StatelessWidget {
  String icon;
  SelectedItemWidget({required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppColors.blackTransparentColor,
      ),
      child: Image.asset(icon,color: AppColors.whiteColor,),
    );
  }
}
