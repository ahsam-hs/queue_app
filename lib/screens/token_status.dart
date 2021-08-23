import 'package:flutter/material.dart';
import 'package:queue_app/values.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:queue_app/models/token_status.dart';

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
          t['id'], t['name'], t['job'], t['room'], t['waiting'], t['serving']);
      tokenStatusList.add(tokenStatusModel);
    }

    print(tokenStatusList.length);
    return tokenStatusList;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        initialData: [],
        future: getTokenStatus(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Loading failed'),
            );
          } else if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return TokenStatusCard(
                    snapshot.data[i].room,
                    snapshot.data[i].name,
                    snapshot.data[i].job,
                    "10",
                    snapshot.data[i].waiting,
                    snapshot.data[i].serving,
                  );
                },
              ),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ],
            );
          }
        },
      ),

      // TokenStatusCard(
      //   'ROOM-1',
      //   'DR. ABDUL MUMIN KHAN',
      //   'Consultant Gaenocologist',
      //   '20',
      //   '10',
      //   '10',
      // ),
      // TokenStatusCard(
      //   'ROOM-10',
      //   'DR. MAUMOON ABDUL QAYOOM',
      //   'Consultant Radiologist',
      //   '10',
      //   '8',
      //   '2',
      // ),
      //   ElevatedButton(
      //       onPressed: () {
      //         getTokenStatus();
      //       },
      //       child: Text('Test'))
      // ],
    );
  }
}

class TokenStatusCard extends StatelessWidget {
  TokenStatusCard(this.roomNum, this.doctorsName, this.doctorSpeciality,
      this.totalPatients, this.waitingPatients, this.servingToken);

  final String roomNum;
  final String doctorsName;
  final String doctorSpeciality;
  final String waitingPatients;
  final String totalPatients;
  final String servingToken;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardInsets,
      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
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
                  doctorsName,
                  style: doctorNameStyle,
                ),
                Text(doctorSpeciality, style: whiteText),
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
                  style: whiteTextLow,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
