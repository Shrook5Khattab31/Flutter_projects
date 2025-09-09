import 'package:flutter/material.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:islami_project/utils/appStyles.dart';

typedef OnTap = void Function();

class ToggleRadioWidget extends StatelessWidget {
  String name;
  bool isSelected;
  OnTap onTap;

  ToggleRadioWidget({
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height * 0.042,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? AppColors.goldColor : Colors.transparent,
          ),
          child: Center(
            child: Text(
              name,
              style: isSelected ? AppStyles.bold16black : AppStyles.bold16white,
            ),
          ),
        ),
      ),
    );
  }
}
