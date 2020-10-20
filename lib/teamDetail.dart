import 'package:flutter/material.dart';
import 'package:fluttermanager/widget/ItemView.dart';
import 'models/team_list_entity.dart';

class TeamDetailPage extends StatefulWidget {
  TeamListEntity user;
  TeamDetailPage({@required this.user});

  @override
  _TeamDetailPageState createState() => _TeamDetailPageState();
}

class _TeamDetailPageState extends State<TeamDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Text("个人详情", style: TextStyle(fontSize: 17, color: Colors.white)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              ItemView(
                lable: '真实姓名',
                value: widget.user.realName,
                width: 60,
              ),
              Divider(
                height: 1.0,
                indent: 15,
                color: Color(0xfff8f8f8),
              ),
              ItemView(
                lable: '性别',
                value: widget.user.sex==0?'男':'女',
                width: 60,
              ),
              Divider(
                height: 1.0,
                indent: 15,
                color: Color(0xfff8f8f8),
              ),
              ItemView(
                lable: '手机号码',
                value: widget.user.userPhone,
                width: 60,
              ),
              Divider(
                height: 1.0,
                indent: 15,
                color: Color(0xfff8f8f8),
              ),
              ItemView(
                lable: '负责区域',
                value: widget.user.region,
                width: 60,
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}