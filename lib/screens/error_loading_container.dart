import 'package:flutter/material.dart';

class ErrorLoadingContainer extends StatelessWidget {
  const ErrorLoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.error,
            size: 50.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Loading failed',
          ),
        ],
      ),
    );
  }
}
