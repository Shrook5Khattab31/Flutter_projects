import 'package:flutter/material.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';
import 'package:islami_project/utils/routeNames.dart';

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackBg,
        centerTitle: true,
        toolbarHeight: height*0.14,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Image.asset(AppImages.islamiLogo,fit: BoxFit.fitHeight,),
        ),
      ),
      backgroundColor: AppColors.blackBg,
      body: IntroductionScreen(
        pages: [
          buildIntroPage(
            image: AppImages.welcomeIntro,
            flexOfImage: 3,
            title: "Welcome To Islami App",
          ),
          buildIntroPage(
            title: "Welcome To Islami",
            description: "Make way forward for Your Own Community.",
            image: AppImages.masjidIntro,
          ),
          buildIntroPage(
            title: "Reading the Quran",
            description: "Read, and your Lord is the Most Generous",
            image: AppImages.quranIntro,
          ),
          buildIntroPage(
            title: "Bearish",
            description: "Praise the name of your Lord, the Most High",
            image: AppImages.duaaIntro,
          ),
          buildIntroPage(
            title: "Holy Quran Radio",
            description: "You can listen to the Holy Quran Radio through the application for free and easily",
            image: AppImages.audioIntro,
          ),
        ],
        onDone: () {
          Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen);
        },
        showBackButton: true,
        back: Text('Back', style: AppStyles.bold16gold),
        next: Text('Next', style: AppStyles.bold16gold),
        done: Text('Finish', style: AppStyles.bold16gold),
        dotsContainerDecorator: BoxDecoration(color: AppColors.blackBg,),
        dotsDecorator: DotsDecorator(
          size: Size(height*0.007, height*0.007),
          color: Colors.grey,
          activeColor: AppColors.goldColor,
          activeSize: Size(width*0.042, height*0.007),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
  PageViewModel buildIntroPage({required String image,int flexOfImage=2, required String title,String description=''}){
    return PageViewModel(
      decoration: PageDecoration(
        pageColor: AppColors.blackBg,
        bodyAlignment: Alignment.bottomCenter,
        imagePadding: EdgeInsets.only(top: 41.5),
        contentMargin: EdgeInsets.symmetric(vertical: 41.5),
        bodyPadding: EdgeInsets.symmetric(horizontal: 16),
        imageFlex: flexOfImage,
        titleTextStyle: AppStyles.bold24gold,
        bodyTextStyle: AppStyles.bold20gold,
      ),
      image: Image.asset(image),
      title: title,
      body: description,
    );
  }
}
