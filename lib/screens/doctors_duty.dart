import 'package:flutter/material.dart';
import 'package:queue_app/screens/error_loading_container.dart';
import 'package:queue_app/screens/waiting_container.dart';
import 'package:queue_app/values.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:queue_app/models/doctors_duty.dart';

class DoctorsDuty extends StatefulWidget {
  @override
  _DoctorsDutyState createState() => _DoctorsDutyState();
}

class _DoctorsDutyState extends State<DoctorsDuty> {
  Future getDoctorsDuty() async {
    var response = await http
        .get(Uri.https("ahmednill.000webhostapp.com", "api/doctors-duty"));
    var jsonData = jsonDecode(response.body.toString());
    List<DoctorsDutyModel> doctorsDutyList = [];

    for (var d in jsonData) {
      DoctorsDutyModel doctorsDutyModel =
          DoctorsDutyModel(d['name'], d['job'], d['room'], d['time']);
      doctorsDutyList.add(doctorsDutyModel);
    }

    return doctorsDutyList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: FutureBuilder(
              initialData: [],
              future: getDoctorsDuty(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return WaitingContainer();
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return DoctorDutyCard(
                          snapshot.data[i].room,
                          snapshot.data[i].name,
                          snapshot.data[i].job,
                          snapshot.data[i].time);
                    },
                  );
                } else {
                  return ErrorLoadingContainer();
                }
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

class DoctorDutyCard extends StatelessWidget {
  DoctorDutyCard(
    this.room,
    this.name,
    this.job,
    this.time,
  );

  final String room;
  final String name;
  final String job;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardInsets,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 24.0,
              color: Color(0x0F524ABF),
            ),
          ],
          color: mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                room,
                style: blueTextStyle,
              ),
              Text(name, style: doctorNameStyle),
              Text(
                job,
                style: blackText,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                time,
                style: blackTextLow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
