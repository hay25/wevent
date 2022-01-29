import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wevent/models/fav_model.dart';
import 'package:wevent/models/sesion_result_model.dart';
import 'package:wevent/models/session_service.dart';
import 'package:wevent/pages/agenda_page.dart';
import 'package:wevent/pages/schedule_pages.dart';
import 'package:wevent/services/app_service.dart';
import 'package:wevent/utils/uit_helper.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController(initialPage: 0);
  List<Session> parsedFavoriteList=[];
  SessionResultModel sessionResultModel = SessionResultModel();
  dynamic prefValue;

  Map<String, List<Session>>? listMap = Map();
  var keys = [];

  List<String> favoriList = [];
  @override
  void initState(){
    // TODO: implement initState
    UIT.loadDatas();

    loadSessionData();
    loadFavList();
    print("List Map LENGTH: ${UIT.listMap!.length}");
    super.initState();
    }
  loadSessionData()async{
    List tempHours = ["09:45","10:15","11:00","13:00","14:00","15:00"];
    sessionResultModel = await AppServices.getSessions(context: context);
    print("DONKEY: DATA GELİYORMU");
    if(sessionResultModel.sessions!.isNotEmpty){
      setState(() {
        sessionResultModel.sessions!.forEach((element) {
          if( favoriList.isNotEmpty && favoriList.contains(element.id))
            parsedFavoriteList.add(element);
        });
    });

  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIT.WeventAppBar("Home"),
      body: bodyUI(),
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo_au.png",width: 50,),
                  Text("International Conference \non Advances in Engineering,\nand Technology",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.timelapse_outlined),
              title: Text('Schedule'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SchedulePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.view_agenda),
              title: Text('Agenda'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AgendaPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  bodyUI() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: UIT.width(context: context),
          height: UIT.height(context: context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              topPagerController(),
              parsedFavoriteList.length <=0 ?
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1,),
                    Text("You can favorite sessions on Schedule page"),
                    ElevatedButton(onPressed: (){
                      UIT.nextPage(context: context, nextPage: SchedulePage());
                    }, child: Text("Go to Schedule Page")),
                    Spacer(flex: 3,),
                  ],
                ),
              ) :
              myFavSessionUI(),

            ],
          ),
        ),
      ),
    );
  }
  topPagerController() {
    return Column(
      children: [
        Container(
          height: UIT.height(context: context) * .2,
          margin: EdgeInsets.all(5),
          child: PageView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage("https://erzurumportali.com/upload/77/55/P4KQ82LE.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)));
            },
          ),
        ),
        // SmoothPageIndicator(
        //     controller: controller,  // PageController
        //     count:  1,
        //     effect:  WormEffect(),  // your preferred effect
        //     onDotClicked: (index){
        //     }
        // )
      ],
    );
  }
  myFavSessionUI() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(3),
          itemCount: parsedFavoriteList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              onDismissed: (direction) {
                //deleteMessageItem(messageList[index].roomid);
                setState(() {
                  setEventFavoriteById(parsedFavoriteList[index].id);
                  parsedFavoriteList.removeAt(index);
                });
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$items[index] dismissed')));
              },
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Mesajları Sil',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                alignment: Alignment.centerRight,
              ),
              child: Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.grey[50],
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  splashColor: Colors.red,
                  onTap: () => {
                  },
                  child: ListTile(
                    leading: Text(parsedFavoriteList![index].date!.toString()+"\nJan"),
                    title: Text(parsedFavoriteList![index].title!),
                    subtitle: Text(parsedFavoriteList![index].authors!.first.name!.isNotEmpty ?
                    parsedFavoriteList![index].authors!.first.name!:""),
                    trailing: Column(
                      children: [
                        Text(parsedFavoriteList![index].hour!),
                        Spacer(),
                        Text(
                          (parsedFavoriteList![index].authors!).isNotEmpty ?
                          parsedFavoriteList![index].room!:
                          "",
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  loadFavList()async{
    var spref = await SharedPreferences.getInstance();
    //spref.setString("favListById", "");
    favoriList = (jsonDecode(spref.get("favListById").toString()) as List<dynamic>).cast<String>();
    setState(() {

    });
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
