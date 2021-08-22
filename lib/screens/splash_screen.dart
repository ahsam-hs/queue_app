import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFF7FF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ungoofaaru',
            style: TextStyle(color: Color(0xFFAA5757), fontSize: 18),
            //style: TextStyle(color: Color.fromARGB(255, 170, 87, 87)),
          ),
          SizedBox(
            height: 20.0,
          ),
          SplashText(),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Hospital',
            style: TextStyle(color: Color(0xFFAA5757), fontSize: 22),
            //style: TextStyle(color: Color.fromARGB(255, 170, 87, 87)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Queue',
            style: TextStyle(color: Color(0xFFAA5757), fontSize: 22),
            //style: TextStyle(color: Color.fromARGB(255, 170, 87, 87)),
          ),
        ],
      ),
    );
  }
}

class SplashText extends StatelessWidget {
  //final String text,

  @override
  Widget build(BuildContext context) {
    return Text(
      'Regional',
      style: TextStyle(color: Color(0xFFAA5757), fontSize: 22),
      //style: TextStyle(color: Color.fromARGB(255, 170, 87, 87)),
    );
  }
}
