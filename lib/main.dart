import 'package:flutter/material.dart';
import 'package:islami_project/screens/hadithScreen/hadithDetailsScreen.dart';
import 'package:islami_project/screens/homeScreen/homeScreen.dart';
import 'package:islami_project/screens/introScreen/introScreen.dart';
import 'package:islami_project/screens/quranScreen/mostRecentProvider.dart';
import 'package:islami_project/screens/quranScreen/suraDetailsScreen/suraDetailsScreen.dart';
import 'package:islami_project/utils/appThemes.dart';
import 'package:islami_project/utils/routeNames.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => MostRecentProvider(),
    child: IslamiApp()
  )
  );
}
class IslamiApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme,
      themeMode: ThemeMode.light,
      initialRoute: RouteNames.introScreen,
      routes: {
        RouteNames.introScreen:(context)=>IntroScreen(),
        RouteNames.homeScreen: (context)=>HomeScreen(),
        RouteNames.suraDetailsScreen: (context)=> SuraDetailsScreen(),
        RouteNames.hadithDetailsScreen: (context)=> HadithDetailsScreen(),
      },
    );
  }

}