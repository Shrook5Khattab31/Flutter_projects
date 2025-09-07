import 'package:flutter/material.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';

class SebhaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى',style: AppStyles.bold36white,),
        Image.asset(AppImages.sebhaCounter),
      ],
    );
  }
}
