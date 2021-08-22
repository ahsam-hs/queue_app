import 'package:flutter/material.dart';
import 'package:queue_app/values.dart';
import 'package:http/http.dart';

class GetToken extends StatelessWidget {
  const GetToken({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10.0,
        ),
        InfoTextField("ID card no./ Passport no.",
            "Enter your ID card no./ passport no."),
        InfoTextField("Phone no.", "Enter your phone number."),
        SizedBox(
          height: 10.0,
        ),
        RegistrationButton('1', 'REGISTRATION', '0'),
        RegistrationButton('2', 'PAYMENT', '0'),
        RegistrationButton('3', 'ABOVE 65', '0'),
        RegistrationButton('4', 'LAB SERVICE', '0'),
        RegistrationButton('5', 'X-RAY', '0'),
        RegistrationButton('6', 'MAKE MEMO FOR APPOINTMENT', '0'),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

class RegistrationButton extends StatelessWidget {
  RegistrationButton(this.buttonNumber, this.title, this.subtitle);

  final String buttonNumber;
  final String title;
  final String subtitle;

  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardInsets,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(mainColor),
        ),
        onPressed: () {},
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: Text(
              buttonNumber,
              style: whiteText,
            ),
          ),
          title: Text(
            title,
            style: whiteText,
          ),
          subtitle: Text(
            'Waiting ' + subtitle,
            style: whiteText,
          ),
        ),
      ),
    );
  }
}

class InfoTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  InfoTextField(this.labelText, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardInsets,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          labelText: labelText,
          hintText: hintText,
          focusColor: mainColor,
        ),
      ),
    );
  }
}
