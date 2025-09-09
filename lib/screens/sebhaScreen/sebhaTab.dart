import 'package:flutter/material.dart';
import 'package:islami_project/screens/sebhaScreen/sebhaInfo.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int counter = 0;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(minutes: 1),
      vsync: this,
    )
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.017),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: AppStyles.bold36white,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 7,
              child: GestureDetector(
                onTap: () {
                  if (counter == 33) {
                    if (index == SebhaInfo.tasbeh.length - 1) {
                      index = 0;
                    } else {
                      index++;
                    }
                    setState(() {});
                    counter = 0;
                    return;
                  }
                  counter++;
                  setState(() {});
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImages
                              .sebhaCounterTail), fit: BoxFit.fill,)
                      ),
                    ),
                    RotationTransition(
                      turns: _controller,
                      child: SizedBox(
                        height: height * 0.4,
                        child: ClipOval(
                          child: Image.asset(AppImages.sebhaCounter,
                            fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(SebhaInfo.tasbeh[index],
                            style: AppStyles.bold36white,
                            textAlign: TextAlign.center,
                          ),
                          Text('$counter',
                            style: AppStyles.bold36white,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
