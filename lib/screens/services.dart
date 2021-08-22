import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:queue_app/values.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10.0,
        ),
        StatusCard(
          'Registration',
          'Expired',
          '0001',
        ),
        StatusCard(
          'Payment',
          'Waiting',
          '0001',
        ),
        StatusCard(
          'Age Above 65',
          'Expired',
          '0001',
        ),
        StatusCard(
          'Lab Service',
          'Expired',
          '0101',
        ),
        StatusCard(
          'X-Ray Service',
          'Expired',
          '0001',
        ),
        StatusCard(
          'Memo For Appointment',
          'Waiting',
          '0022',
        ),
      ],
    );
  }
}

class StatusCard extends StatelessWidget {
  StatusCard(this.registrationType, this.status, this.tokenNumber);

  final String registrationType;
  final String status;
  final String tokenNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardInsets,
      child: Container(
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    registrationType,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      status,
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tokenNumber,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
