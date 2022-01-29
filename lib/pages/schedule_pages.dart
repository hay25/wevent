import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:wevent/models/fav_model.dart';
import 'package:wevent/models/presentation_item_model.dart';
import 'package:wevent/models/sesion_result_model.dart';
import 'package:wevent/models/session_service.dart';
import 'package:wevent/models/topic_labels_model.dart';
import 'package:wevent/pages/detail_page.dart';
import 'package:wevent/services/app_service.dart';
import 'package:wevent/utils/app_enums.dart';
import 'package:wevent/utils/app_theme.dart';
import 'package:wevent/utils/uit_helper.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool isFirstDay = true;
  bool isSecondtDay = false;
  bool isThirdDay = false;

  int day = 14;



  //Map<String, List<PresentationItem>>? listMap = Map();
  int mapCounter = 0;
  var keys = [];
  SessionResultModel sessionResultModel = SessionResultModel();
  List<Session> presentationList945=[];
  List<Session> presentationList1015=[];
  List<Session> presentationList1100=[];
  List<Session> presentationList1300=[];
  List<Session> presentationList1400=[];
  List<Session> presentationList1500=[];

  List<String> favoriList = [];

  Map<String, List<Session>>? listMap = Map();
  @override
  void initState() {
    super.initState();
    //UIT.loadDatas();
    loadSessionData();
    loadFavList();
    print("FavList: ${UIT.favList.length}");
    // listMap!.putIfAbsent("09:45", () => presentationList945);
    // listMap!.putIfAbsent("10:15", () => presentationList1015);
    // listMap!.putIfAbsent("11:00", () => presentationList1015);

    keys = UIT.listMap!.keys.toList();
    print(keys.length.toString());
    for (var i = 0; i < keys.length; i++) {
      mapCounter += UIT.listMap![keys[i]]!.length;
    }
  }

  loadSessionData()async{
    List tempHours = ["09:45","10:15","11:00","13:00","14:00","15:00"];
    sessionResultModel = await AppServices.getSessions(context: context);
    print("DONKEY: DATA GELİYORMU");
    if(sessionResultModel.sessions!.isNotEmpty){
      print("DONKEY: DATA GELDI");

   /*   sessionResultModel.sessions!.forEach((e) {
        tempHours.shuffle();
        e.hour = tempHours.first;
      });

    */

      sessionResultModel.sessions!.forEach((e) {
        if(e.hour == "09:45") {presentationList945.add(e);}
        else if(e.hour == "10:15")presentationList1015.add(e);
        else if(e.hour == "11:00")presentationList1100.add(e);
        else if(e.hour == "13:00")presentationList1300.add(e);
        else if(e.hour == "14:00")presentationList1400.add(e);
        else if(e.hour == "15:00")presentationList1500.add(e);
      });
    }

    listMap!.putIfAbsent("09:45", () => presentationList945);
    listMap!.putIfAbsent("10:15", () => presentationList1015);
    listMap!.putIfAbsent("11:00", () => presentationList1100);
    listMap!.putIfAbsent("13:00", () => presentationList1300);
    listMap!.putIfAbsent("14:00", () => presentationList1400);
    listMap!.putIfAbsent("15:00", () => presentationList1500);
    keys = UIT.listMap!.keys.toList();
    setState(() {

    });

  }

  loadFavList()async{
    var spref = await SharedPreferences.getInstance();
    favoriList = (jsonDecode(spref.get("favListById").toString()) as List<dynamic>).cast<String>();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIT.WeventAppBar("Schedule"),
      body: bodyUI(),
     /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          UIT.bottomSheetDialog(context, [Text("Test")], 30);
        },
        child: Icon(Icons.filter_alt_outlined),
      ),*/
    );
  }

  bodyUI() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFirstDay = true;
                      isSecondtDay = false;
                      isThirdDay = false;
                      day = 14;
                    });
                  },
                  child: Text("JAN 14"),
                  style: ElevatedButton.styleFrom(
                    primary: isFirstDay ? Colors.purple : Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFirstDay = false;
                      isSecondtDay = true;
                      isThirdDay = false;
                      day=15;
                    });
                  },
                  child: Text("JAN 15"),
                  style: ElevatedButton.styleFrom(
                    primary: isSecondtDay ? Colors.purple : Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  )
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFirstDay = false;
                      isSecondtDay = false;
                      isThirdDay = true;
                      day=16;
                    });
                  },
                  child: Text("JAN 16"),
                  style: ElevatedButton.styleFrom(
                    primary: isThirdDay ? Colors.purple : Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  )
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
            ListView.builder(
                itemCount: listMap!.keys.length,
                itemBuilder: (context, index) {
                  String key = listMap!.keys.elementAt(index);
                  //listMap![key].where((element) => element.date == day).isNotEmpty;
                  return
                    StickyHeader(
                      header: Container(
                        height: 50.0,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${key}\nAM",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      content: Column(
                        children: [
                          for(var i=0;i<listMap![key]!.length;i++)
                            if(listMap![key]![i].date == day)
                            InkWell(
                              onTap: (){
                                UIT.nextPage(context: context, nextPage: DetailPage(session: listMap![key]![i],));
                              },
                              child: Container(
                              margin: EdgeInsets.only(left: 60, right: 20, top: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[200]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            listMap![key]![i].title!,
                                            style: AppTheme.appTextTheme.bodyText1,
                                          ),
                                        ),
                                        InkWell(
                                            child: Icon( (favoriList.isNotEmpty && favoriList.contains(listMap![key]![i].id)) ? Icons.star:Icons.star_border, size: 26,),
                                          onTap: (){
                                            setState(() {
                                             // listMap![key]![i].isFavorite = !listMap![key]![i].isFavorite!;
                                             // setEventFavorite(key,i, listMap![key]![i].isFavorite!);
                                              setEventFavoriteById(listMap![key]![i].id);
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:Text(listMap![key]![i].authors!.length>0 && listMap![key]![i].authors!.first.name!.isNotEmpty?
                                          "${listMap![key]![i].authors![0].name!}\n${listMap![key]![i].authors!.length>1?"...":""}":"",
                                          style: AppTheme.appTextTheme.headline6),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                        child: Text(listMap![key]![i].room!, style: TextStyle(fontWeight: FontWeight.w600),),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        for(var j=0;j<listMap![key]![i].labels!.length;j++)
                                        UIT.WeventTag(listMap![key]![i].labels![j].name!,listMap![key]![i].labels![j].color! ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                          ),
                            ),
                        ],
                      ),
                    );
                }),
          ),
        ),
      ],
    );
  }

  setEventFavorite(String key, int index, bool flag)async
  {
    print("key: ${key} index: ${index}");
    var f = FavoriteModel(index: index, key: key, day: day );
    var item = UIT.favList.firstWhere((x) => x.key == f.key && x.index== f.index, orElse: () => FavoriteModel(index: -1, key: "null", day: 0));
    if(flag){
      if(item.index == -1)
          UIT.favList.add(f);
    }else{
      UIT.favList.remove(item);
    }
    final String encodedData = jsonEncode(UIT.favList);
    print(UIT.favList.length);
    print(encodedData);
    var spref = await SharedPreferences.getInstance();
    spref.setString('favList', encodedData);

  }
  setEventFavoriteById(String id)async{
    var spref = await SharedPreferences.getInstance();
    if(!favoriList.contains(id))
      favoriList.add(id);
    else
      favoriList.remove(id);

    final String encodedData = jsonEncode(favoriList);
    spref.setString('favListById', encodedData);
  }
}
