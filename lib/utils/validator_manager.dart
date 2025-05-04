import 'package:flutter/material.dart';

class ValidatorManager {
  static String? firstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter your first name';;
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter your last name';;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter your email';;
    }
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'email error';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    var regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'enter your password';
    }
    if (!regex.hasMatch(value)) {
      return 'password error';
    }
    return null;
  }

  static String? validateusername(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter your username';
    }

    return null;
  }
}