import 'dart:convert';
import 'package:queue_app/screens/error_loading_container.dart';

import 'waiting_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:queue_app/values.dart';
import 'package:http/http.dart' as http;
import 'package:queue_app/models/services_model.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  Future getServices() async {
    var response = await http
        .get(Uri.https("ahmednill.000webhostapp.com", "api/services"));
    var jsonData = jsonDecode(response.body.toString());
    List<ServicesModel> servicesList = [];

    for (var s in jsonData) {
      ServicesModel servicesModel =
          ServicesModel(s['waiting'], s['name'], s['serving']);
      servicesList.add(servicesModel);
    }

    return servicesList;
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
              future: getServices(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: WaitingContainer(),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return StatusCard(
                            snapshot.data[i].regType,
                            snapshot.data[i].waitingNum,
                            snapshot.data[i].tokenNum);
                      });
                } else {
                  return ErrorLoadingContainer();
                }
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // StatusCard(
          //   'Registration',
          //   'Expired',
          //   '0001',
          // ),
          // StatusCard(
          //   'Payment',
          //   'Waiting',
          //   '0001',
          // ),
          // StatusCard(
          //   'Age Above 65',
          //   'Expired',
          //   '0001',
          // ),
          // StatusCard(
          //   'Lab Service',
          //   'Expired',
          //   '0101',
          // ),
          // StatusCard(
          //   'X-Ray Service',
          //   'Expired',
          //   '0001',
          // ),
          // StatusCard(
          //   'Memo For Appointment',
          //   'Waiting',
          //   '0022',
          // ),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  StatusCard(this.registrationType, this.waitingNum, this.tokenNumber);

  final String registrationType;
  final String waitingNum;
  final String tokenNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardInsets,
      child: Container(
        decoration: cardDecoration,
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
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Waiting: " + waitingNum,
                      style: TextStyle(color: Colors.black54, fontSize: 10.0),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tokenNumber,
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
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
