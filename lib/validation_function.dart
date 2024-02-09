import 'package:flutter/material.dart';

class MyFunctions {
  static String? emailValidator(String? value) {
    final bool emailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!);
    if (value.isEmpty) {
      return "Enter email";
    } else if (!emailValid) {
      return "Valid email";
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    final bool passwordValid = RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(value!);
    if (value.isEmpty) {
      return "Enter password";
    } else if (value.length < 8) {
      return "Length should be of 8 characters";
    } else if (!passwordValid) {
      return "Password needs uppercase, number, special character";
    } else {
      return null;
    }
  }

  static String? fullNameValidator(String? value) {
    final bool fullNameValid =
        RegExp(r'^[a-zA-Z]+(?:\s+[a-zA-Z]+)*$').hasMatch(value!);
    if (value.isEmpty) {
      return "Enter your Full Name";
    } else if (!fullNameValid) {
      return "Name is invalid";
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(
      String? value, TextEditingController passwordController) {
    if (value!.isEmpty) {
      return "Please confirm your password.";
    } else if (value != passwordController.text) {
      return "Passwords do not match.";
    } else {
      return null;
    }
  }
}
