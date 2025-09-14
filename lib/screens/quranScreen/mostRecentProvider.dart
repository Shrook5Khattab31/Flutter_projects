import 'package:flutter/material.dart';
import 'package:islami_project/screens/quranScreen/sharedPrefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier{
  List<int> mostRecentList=[];
  Future<void> readMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentStringList = prefs.getStringList(SharedPrefs.mostRecentKey) ?? [];
    mostRecentList = mostRecentStringList.map((element) => int.parse(element)).toList(); // <-- This line was missing
    notifyListeners();
  }
}