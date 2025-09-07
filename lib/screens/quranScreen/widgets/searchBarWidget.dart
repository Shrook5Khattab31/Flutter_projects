import 'package:flutter/material.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04,),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Sura Name',
          hintStyle: AppStyles.bold16white,
          filled: true,
          prefixIcon: Image.asset(AppImages.quranIcon,color: AppColors.goldColor,),
          fillColor: AppColors.blackTransparentColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.goldColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.goldColor,
            ),
          ),
        ),
      ),
    );
  }
}
