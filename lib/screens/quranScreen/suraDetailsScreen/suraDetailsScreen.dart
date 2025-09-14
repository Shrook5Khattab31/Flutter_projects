import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/screens/quranScreen/surasInfo.dart';
import 'package:islami_project/utils/appColors.dart';
import 'package:islami_project/utils/appImages.dart';
import 'package:islami_project/utils/appStyles.dart';

class SuraDetailsScreen extends StatefulWidget{
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late int index;
  int? selectedIndex;
  List<String> suraLines= [];
  bool isLoaded=false;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    index=ModalRoute.of(context)!.settings.arguments as int;
    if(!isLoaded) {
      isLoaded = true;
      loadFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        toolbarHeight: height*0.08,
        leading: InkWell(
          child: Icon(Icons.arrow_back,), onTap: () {
          Navigator.pop(context);
        },),
        title: Text(SurasInfo.englishQuranSurahs[index],style: AppStyles.bold20gold,),
        actions: [
          GestureDetector(
              onTap: () {
                if (!isPressed) {
                  isPressed = true;
                } else {
                  isPressed = false;
                }
                setState(() {});
              },
              child: Icon(
                isPressed ? Icons.table_rows_rounded : Icons
                    .wrap_text_rounded, size: 28,)
          ),
        ],
      ),
      backgroundColor: AppColors.blackBg,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.suraDecoration)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8,bottom: height*0.08),
                child: Text(SurasInfo.arabicAuranSuras[index],style: AppStyles.bold24gold,),
              ),
              suraLines.isEmpty?
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.goldColor,
                  ),
                ),
              ):
              isPressed ? changeToRows() : changeToContainers(),
              SizedBox(height: height*0.13,),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> loadFile(int index) async {
    String fileContent= await rootBundle.loadString('assets/files/Suras/${index+1}.txt');
    List<String> verses=fileContent.split('\n');
    suraLines = verses;
    setState(() {});
  }

  Widget changeToRows() {
    return Expanded(
      child: SingleChildScrollView(
        child: Text.rich(
          TextSpan(
            children: List.generate(suraLines.length, (index) {
              return TextSpan(
                text: '[${index + 1}] ${suraLines[index]}',
                style: AppStyles.bold20gold,
              );
            }),
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget changeToContainers() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              decoration: BoxDecoration(
                color: selectedIndex == index ? AppColors.goldColor : Colors
                    .transparent,
                border: BoxBorder.all(color: AppColors.goldColor),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text('[${index + 1}] ${suraLines[index]}',
                style: selectedIndex == index
                    ? AppStyles.bold20black
                    : AppStyles.bold20gold,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 8,),
        itemCount: suraLines.length,
      ),
    );
  }
}