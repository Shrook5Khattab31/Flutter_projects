import 'package:flutter/material.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';

class RadioContent extends StatefulWidget {
  int index;
  bool isRadioSelected;

  RadioContent({required this.index, required this.isRadioSelected});

  @override
  State<RadioContent> createState() => _RadioContentState();
}

class _RadioContentState extends State<RadioContent> {
  bool isPlaying = false;

  List<String> sheikhNames = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik Shaibat Alhamed',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.012),
      height: height * 0.14,
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        image: DecorationImage(
          image: AssetImage(
            isPlaying
                ? AppImages.playedDecoration
                : AppImages.notPlayedDecoration,
          ),
          alignment: Alignment.bottomCenter,
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.isRadioSelected
                ? 'Radio ${sheikhNames[widget.index]}'
                : sheikhNames[widget.index],
            style: AppStyles.bold20black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 6),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                child: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: height * 0.05,
                ),
              ),
              GestureDetector(
                child: Icon(
                  !isPlaying
                      ? Icons.volume_up_rounded
                      : Icons.volume_off_rounded,
                  size: height * 0.032,
                ),
              ),
              Spacer(flex: 5),
            ],
          ),
        ],
      ),
    );
  }
}
