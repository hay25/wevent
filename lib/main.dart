import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wevent/pages/agenda_page.dart';
import 'package:wevent/pages/home_page.dart';
import 'package:wevent/pages/schedule_pages.dart';
import 'package:wevent/utils/uit_helper.dart';

void main() async{
  //var spref = await SharedPreferences.getInstance();
 // UIT.loadDatas();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/schedule": (context) => SchedulePage(),
        "/agenda": (context) => AgendaPage(),
      },
    );
  }
}

