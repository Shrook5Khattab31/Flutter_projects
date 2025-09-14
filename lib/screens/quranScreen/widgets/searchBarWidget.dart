import 'package:flutter/material.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';

import '../surasInfo.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(List<int>) onSearch;

  SearchBarWidget({required this.onSearch,});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: TextField(
        onChanged: searchByNewText,
        style: AppStyles.bold16white,
        decoration: InputDecoration(
          hintText: 'Sura Name',
          hintStyle: AppStyles.bold16white,
          filled: true,
          prefixIcon: Image.asset(AppImages.quranIcon, color: AppColors.goldColor),
          fillColor: AppColors.blackTransparentColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.goldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.goldColor),
          ),
        ),
      ),
    );
  }
  void searchByNewText(String newText) {
    List<int> searchResult = [];
    for (int i = 0; i < SurasInfo.englishQuranSurahs.length; i++) {
      if (SurasInfo.englishQuranSurahs[i].toLowerCase().contains(newText.toLowerCase()) ||
          SurasInfo.arabicAuranSuras[i].toLowerCase().contains(newText.toLowerCase())) {
        searchResult.add(i);
      }
    }
    widget.onSearch(searchResult);
  }
}

