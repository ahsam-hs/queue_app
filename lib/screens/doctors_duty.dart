import 'package:flutter/material.dart';
import 'package:queue_app/values.dart';

class DoctorsDuty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10.0,
        ),
        DoctorDutyCard(
            dutyType: 'IPD',
            doctorName: 'DR. SAIFEDDIN ABDUL MUMIN',
            speciality: 'Consultant Psychiatrist',
            dutyTime: '12:00 - 14:00')
      ],
    );
  }
}

class DoctorDutyCard extends StatelessWidget {
  const DoctorDutyCard({
    Key? key,
    required this.dutyType,
    required this.doctorName,
    required this.speciality,
    required this.dutyTime,
  }) : super(key: key);

  final String dutyType;
  final String doctorName;
  final String speciality;
  final String dutyTime;

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
                dutyType,
                style: blueTextStyle,
              ),
              Text(doctorName, style: doctorNameStyle),
              Text(
                speciality,
                style: whiteText,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                dutyTime,
                style: whiteTextLow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
