import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static const String mostRecentKey='most_recent';

  static void saveLastSuraIndex(int newSuraIndex) async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    List<String> mostRecentList= prefs.getStringList(SharedPrefs.mostRecentKey)??[];
      mostRecentList.remove('$newSuraIndex');
      mostRecentList.insert(0, '$newSuraIndex');
    if (mostRecentList.length > 5) {
      mostRecentList = mostRecentList.sublist(0, 5);
    }
    await prefs.setStringList(SharedPrefs.mostRecentKey, mostRecentList);
  }
}