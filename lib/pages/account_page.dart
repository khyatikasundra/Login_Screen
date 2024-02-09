import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final String emailIdGet;
  final String passwordGet;
  final String fullName;
  final String confirmPassword;
  const AccountPage(
      {required this.emailIdGet,
      required this.passwordGet,
      required this.confirmPassword,
      required this.fullName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            cardView(emailIdGet, textInfo: "Email"),
            cardView(passwordGet, textInfo: "password"),
            cardView(fullName, textInfo: "Full Name"),
            cardView(confirmPassword, textInfo: "Confirm Password")
          ],
        ),
      )),
    );
  }

  Widget cardView(String? text, {String? textInfo}) => Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text("$textInfo : $text"),
      ));
}
