import 'package:flutter/material.dart';

class WaitingContainer extends StatelessWidget {
  const WaitingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        ),
        SizedBox(
          height: 20,
        ),
        Text('Awaiting result...'),
      ],
    );
  }
}
