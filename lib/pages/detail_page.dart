import 'package:flutter/material.dart';
import 'package:wevent/models/presentation_item_model.dart';
import 'package:wevent/models/session_service.dart';
import 'package:wevent/utils/app_theme.dart';
import 'package:wevent/utils/uit_helper.dart';

class DetailPage extends StatefulWidget {
  Session session;
  DetailPage({Key? key, required this.session}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: UIT.WeventAppBar("Details"),
      body: bodyUI(),
    ));
  }

  bodyUI() {
    return SingleChildScrollView(
      child: Container(
        width: UIT.width(context: context),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.session.title!, style: AppTheme.appTextTheme.bodyText1!.copyWith(fontSize: 18),),
            Padding(
              padding: const EdgeInsets.only(top:14.0),
              child: Text("Dec " + widget.session.date!.toString() + ", " + widget.session.hour! +" AM", style: AppTheme.appTextTheme.bodyText2!.copyWith(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:4.0),
              child: Text(widget.session.room!, style: AppTheme.appTextTheme.bodyText2!.copyWith(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text(widget.session.welcomeAbstract, style: AppTheme.appTextTheme.bodyText2!.copyWith(fontSize: 14),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0, bottom: 14),
              child: Row(
                children: [
                  for(var j=0;j<widget.session.labels!.length;j++)
                    UIT.WeventTag(widget.session.labels![j].name!,widget.session.labels[j].color),
                ],
              ),
            ),
            Text("SPEAKERS",style: AppTheme.appTextTheme.bodyText2!.copyWith(fontSize: 16),),
            for(var i = 0; i<widget.session.authors!.length; i++)
              ListTile(
                leading: Icon(Icons.face, size: 40,),
                title: Text(widget.session.authors![i].name!, style: AppTheme.appTextTheme.bodyText1!.copyWith(fontSize: 14),),
                subtitle: Text(widget.session.authors![i].institution!,style: AppTheme.appTextTheme.bodyText2!.copyWith(fontSize: 13),),
              ),

          ],
        ),
      ),
    );
  }
}
