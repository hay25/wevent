import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wevent/models/authors_model.dart';
import 'package:wevent/models/fav_model.dart';
import 'package:wevent/models/presentation_item_model.dart';
import 'package:wevent/models/session_service.dart';
import 'package:wevent/models/topic_labels_model.dart';
import 'package:wevent/utils/app_enums.dart';

import 'app_theme.dart';


class UIT {
  static double width({ required BuildContext context}) {
    return MediaQuery
        .of(context)
        .size
        .width;
  }

  static double height({required BuildContext context}) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }

  ///Verilen sayfaya doğrudan route sağlar.
  /// * context  : BuildContext
  /// * nextPage : Statefull ya da Stateless Widget
  static void nextPage(
      {required BuildContext context, required Widget nextPage}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );
  }

  static void back({required BuildContext context}) {
    Navigator.pop(context);
  }

  static bottomSheetDialog(BuildContext context, List<Widget> actions,
      double height) {
    actions.insert(0, UIT().sheetLine(context));
    actions.add(SizedBox(
      height: 0,
    ));
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
      ),
      builder: (context) {
        return Container(
          height: UIT.height(context: context) * height,
          width: UIT.width(context: context),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: actions),
        );
      },
    );
  }

  Widget sheetLine(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        height: 5,
        width: UIT.width(context: context) * .15,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ));
  }


  static alertBasicDialog({
    required BuildContext context,
    required String title,
    required String message,
    bool doubleBack = false
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          title: Center(
            child: Text(
              title,
              style: TextStyle(),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Tamam",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (doubleBack) Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static alertBasicWithCallbackDialog({
    required BuildContext context,
    required String title,
    required String message,
    bool doubleBack = false,
    required Function callback,
    bool yesNo = false,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          title: Center(
            child: Text(
              title,
              style: TextStyle(),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            if(yesNo)...
            [
              TextButton(
                child: Text(
                  "İptal",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (doubleBack) Navigator.of(context).pop();
                  callback(false);
                },
              ),
              TextButton(
                child: Text(
                  "Tümünü Sil",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (doubleBack) Navigator.of(context).pop();
                  callback(true);
                },
              ),
            ],
            if(!yesNo)
              TextButton(
                child: Text(
                  "Tamam",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (doubleBack) Navigator.of(context).pop();
                  callback(true);
                },
              ),
          ],
        );
      },
    );
  }

  static WeventAppBar(String title){
    return AppBar(
      title: Text(title,style: TextStyle(color: Colors.grey),),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.green),
    );
  }

  static WeventTag(String title, String tagColor){
    MaterialColor color;
    switch(tagColor){
      case "purple": {
        color = Colors.purple;
      }
      break;
      case "levander": {
        color = Colors.lightGreen;
      }
      break;
      case "pink": {
        color = Colors.pink;
      }
      break;
      case "yellow": {
        color = Colors.yellow;
      }
      break;
      case "mint green": {
        color = Colors.green;
      }
      break;
      case "blue": {
        color = Colors.blue;
      }
      break;
      case "turquoise": {
        color = Colors.teal;
      }
      break;
      default:{
        color = Colors.grey;
      }
      break;
    }
    return  Row(
      children: [
        Container(
          width:12,
          height: 12,
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle
          ),
        ),
        Text(title,style: AppTheme.appTextTheme.bodyText2,)

      ],
    );
  }

  static List<FavoriteModel> favList = [];
  static Map<String, List<Session>>? listMap = Map();

  static List<Session> presentationList945=[];
  static List<Session> presentationList1015=[];
  static List<Session> presentationList1100=[];
  static List<Session> presentationList1300=[];
  static List<Session> presentationList1400=[];
  static List<Session> presentationList1500=[];

  static bool coldStart = true;

  static loadDatas() async{
    listMap!.putIfAbsent("09:45", () => presentationList945);
    listMap!.putIfAbsent("10:15", () => presentationList1015);
    listMap!.putIfAbsent("11:00", () => presentationList1100);
    listMap!.putIfAbsent("13:00", () => presentationList1300);
    listMap!.putIfAbsent("14:00", () => presentationList1400);
    listMap!.putIfAbsent("15:00", () => presentationList1500);

    var spref = await SharedPreferences.getInstance();
    List<dynamic> parsedFavoriteList = jsonDecode(spref.get("favList").toString());
    print(parsedFavoriteList);
    parsedFavoriteList.forEach((element) {
      UIT.listMap![element["key"]]![int.parse(element["index"])].isFavorite = true;
      if(coldStart)
      {
        print("Fav ladim");
        UIT.favList.add(FavoriteModel(index: int.parse(element["index"]), key: element["key"], day: int.parse(element["day"])));
      }
    });
    coldStart = false;
  }

}