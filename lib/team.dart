
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttermanager/httpUtil/DioManager.dart';
import 'package:fluttermanager/httpUtil/NWApi.dart';
import 'package:fluttermanager/httpUtil/NWMethod.dart';
import 'package:fluttermanager/widget/ViewNoData.dart';

import 'models/team_list_entity.dart';
import 'routeUtil/FadeRoute.dart';
import 'widget/PhotoViewSimpleScreen.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

List<TeamListEntity> teams = new List();

class _TeamPageState extends State<TeamPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyTeamList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text("我的团队", style: TextStyle(fontSize: 17, color: Colors.white)),
          centerTitle: true,
        ),
        body: teams.length > 0
            ? Container(
                constraints: BoxConstraints.expand(),
                color: Color(0xfff8f8f8),
                child: childWidget(context),
              )
            : ViewNoDataPage());
  }

  void getMyTeamList() {
    DioManager().requestList<TeamListEntity>(NWMethod.POST, NWApi.teamList,
        params: {}, success: (List<TeamListEntity> lists) {
      setState(() {
        teams.clear();
        teams.addAll(lists);
      });
    }, error: (error) {
      print("error code = ${error.errorCode}, massage = ${error.message}");
    });
  }
}
//主页面
Widget childWidget(BuildContext context) {
  Widget childWidget;
  if (teams != null && teams.length != 0) {
    childWidget = new ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, pos) {
        return _cellForRow(teams[pos],context);
      },
    );
  } else {
    childWidget = new Stack(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
          child: new Center(
            child: SpinKitFadingCircle(
              color: Colors.blueAccent,
              size: 30.0,
            ),
          ),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
          child: new Center(
            child: new Text('正在加载中，莫着急哦~'),
          ),
        ),
      ],
    );
  }
  return childWidget;
}
// 相当于itemView
Widget _cellForRow(TeamListEntity user,BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10), // 上间距
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          child: Image.network(NWApi.baseApi + user.portraitUrl,width: 60,),
          onTap: (){//查看大图
            lookBigPicture(context,NWApi.baseApi + user.portraitUrl);
          },
        ),
        Padding(
          padding: new EdgeInsets.only(left: 10),
          child: Text(user.realName,style: TextStyle(fontSize: 15,color: Color(0xff333333))),
        )
      ],
    ),
  );
}
void lookBigPicture(BuildContext context,String s) {
  Navigator.of(context).push(new FadeRoute(page: PhotoViewSimpleScreen(
    imageProvider:NetworkImage(s),
    heroTag: 'simple',
  )));
}
