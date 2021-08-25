import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queue_app/screens/doctors_duty.dart';
import 'package:queue_app/screens/get_token.dart';
import 'package:queue_app/screens/services.dart';
import 'package:queue_app/screens/token_status.dart';
import 'package:queue_app/values.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.black87,
              tabs: [
                Tab(text: 'Get Token'),
                Tab(text: 'Services'),
                Tab(text: 'Token Status'),
                Tab(text: "Doctors' Duty"),
              ],
            ),
            title: Text(
              'URH Queue',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          body: TabBarView(children: [
            GetToken(),
            Services(),
            TokenStatus(),
            DoctorsDuty(),
          ]),
        ));
  }
}
