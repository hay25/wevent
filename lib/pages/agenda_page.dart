import 'package:flutter/material.dart';
import 'package:wevent/utils/app_theme.dart';
import 'package:wevent/utils/uit_helper.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIT.WeventAppBar("Agenda"),
      body: bodyUI(),
    );
  }

  bodyUI() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: UIT.width(context: context),
          color: Colors.white,
          child: agendaListUI(),
        ),
      ),
    );
  }

  agendaListUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("Thursday Dec 14",style: AppTheme.appTextTheme.bodyText1!.copyWith(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("Registration"),
              subtitle: Text("8:00 AM - 6:00 PM"),
              trailing: SizedBox(width: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffFDEAC5),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("Breakfast"),
              subtitle: Text("8:00 AM - 9:30 AM"),
              trailing: SizedBox(width: 20),
            ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffF0C5FD),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("Opening Ceremony"),
              subtitle: Text("9:45 AM - 10:30 AM"),
              trailing: SizedBox(width: 20),
            ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffC5FDD0),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("Sessions "),
              subtitle: Text("10:45 AM - 12:15 PM"),
              trailing: SizedBox(width: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffC5C7FD),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("After Dark "),
              subtitle: Text("7:00 PM - 10:00 PM"),
              trailing: SizedBox(width: 20),
            ),

          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("Thursday Dec 15",style: AppTheme.appTextTheme.bodyText1!.copyWith(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffFDEAC5),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("Breakfast"),
              subtitle: Text("8:00 AM - 9:30 AM"),
              trailing: SizedBox(width: 20),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffC5FDD0),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("Sessions "),
              subtitle: Text("10:45 AM - 12:15 PM"),
              trailing: SizedBox(width: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffC5C7FD),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("After Dark "),
              subtitle: Text("7:00 PM - 10:00 PM"),
              trailing: SizedBox(width: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("Thursday Dec 16",style: AppTheme.appTextTheme.bodyText1!.copyWith(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffFDEAC5),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("Breakfast"),
              subtitle: Text("8:00 AM - 9:30 AM"),
              trailing: SizedBox(width: 20),
            ),

          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffC5FDD0),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("Sessions "),
              subtitle: Text("10:45 AM - 12:15 PM"),
              trailing: SizedBox(width: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 4),
          child: Container(
            width: UIT.width(context: context) * .85,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffC5C7FD),
            ),
            child:ListTile(
              leading: SizedBox(
                width: 30,
              ),
              title: Text("After Dark "),
              subtitle: Text("7:00 PM - 10:00 PM"),
              trailing: SizedBox(width: 20),
            ),

          ),
        ),
      ],
    );
  }
}
