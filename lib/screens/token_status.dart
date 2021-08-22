import 'package:flutter/material.dart';
import 'package:queue_app/values.dart';

class TokenStatus extends StatelessWidget {
  const TokenStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10.0,
        ),
        TokenStatusCard(
          'ROOM-1',
          'DR. ABDUL MUMIN KHAN',
          'Consultant Gaenocologist',
          '20',
          '10',
          '10',
        ),
        TokenStatusCard(
          'ROOM-10',
          'DR. MAUMOON ABDUL QAYOOM',
          'Consultant Radiologist',
          '10',
          '8',
          '2',
        ),
      ],
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
