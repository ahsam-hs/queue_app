import 'package:flutter/material.dart';
import 'package:queue_app/screens/error_loading_container.dart';
import 'package:queue_app/values.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:queue_app/models/token_status.dart';
import 'waiting_container.dart';

class TokenStatus extends StatefulWidget {
  const TokenStatus({Key? key}) : super(key: key);

  @override
  _TokenStatusState createState() => _TokenStatusState();
}

class _TokenStatusState extends State<TokenStatus> {
  Future getTokenStatus() async {
    var response = await http
        .get(Uri.https("ahmednill.000webhostapp.com", "api/token-status"));

    var jsonData = jsonDecode(response.body.toString());
    List<TokenStatusModel> tokenStatusList = [];

    for (var t in jsonData) {
      TokenStatusModel tokenStatusModel = TokenStatusModel(
          t['id'],
          t['name'],
          t['job'],
          t['room'],
          t['waiting'],
          t['serving'],
          t['total_patients'],
          t['avatar']);
      tokenStatusList.add(tokenStatusModel);
    }

    return tokenStatusList;
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
              future: getTokenStatus(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return WaitingContainer();
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return TokenStatusCard(
                        snapshot.data[i].room,
                        snapshot.data[i].name,
                        snapshot.data[i].job,
                        snapshot.data[i].totalPatients,
                        snapshot.data[i].waiting,
                        snapshot.data[i].serving,
                        snapshot.data[i].avatar,
                      );
                    },
                  );
                } else {
                  return ErrorLoadingContainer();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TokenStatusCard extends StatelessWidget {
  TokenStatusCard(
    this.roomNum,
    this.doctorsName,
    this.doctorSpeciality,
    this.totalPatients,
    this.waitingPatients,
    this.servingToken,
    this.avatarLink,
  );

  final String roomNum;
  final String doctorsName;
  final String doctorSpeciality;
  final String waitingPatients;
  final String totalPatients;
  final String servingToken;
  final String avatarLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardInsets,
      child: Container(
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: mainDarkColor,
                spreadRadius: 0.5,
              )
            ]),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Image.network(avatarLink),
                  radius: 30.0,
                ),
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(roomNum, style: blueTextStyle),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  doctorsName.length > 30
                      ? doctorsName.substring(0, 29)
                      : doctorsName,
                  style: doctorNameStyle,
                ),
                Text(doctorSpeciality, style: blackText),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Total Patients ' +
                      totalPatients +
                      '\t Waiting ' +
                      waitingPatients +
                      '\t Serving ' +
                      servingToken,
                  style: blackTextLow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
