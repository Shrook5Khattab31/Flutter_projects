import 'package:flutter/material.dart';
import 'package:islami_project/screens/radioScreen/widgets/radioContent.dart';
import 'package:islami_project/screens/radioScreen/widgets/toggleRadioWidget.dart';
import 'package:islami_project/utils/appColors.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          spacing: height * 0.017,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blackTransparentColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  ToggleRadioWidget(
                    name: 'Radio',
                    isSelected: isSelected,
                    onTap: () {
                      isSelected = true;
                      setState(() {});
                    },
                  ),
                  ToggleRadioWidget(
                    name: 'Reciters',
                    isSelected: !isSelected,
                    onTap: () {
                      isSelected = false;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    RadioContent(index: index, isRadioSelected: isSelected),
                separatorBuilder: (context, index) =>
                    SizedBox(height: height * 0.017),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
