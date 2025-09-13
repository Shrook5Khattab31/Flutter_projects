import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/screens/hadithScreen/widgets/hadithContent.dart';

class HadithTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height*0.03,bottom: height*0.02),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) => HadithContent(index: index,),
            options: CarouselOptions(
              viewportFraction: 0.7,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              height: height*0.61,
              enlargeFactor: 0.15,
            ),
            itemCount: 50,
          ),
        ],
      ),
    );
  }
}
