import 'package:flutter/material.dart';

mixin CommonValidations {
  static const int passwordMinLength = 8;
  static const int otpLength = 6;

  @protected
  String? isValidTitle(String? title) {
    if (title == null || title.isEmpty) {
      return "Title cannot be empty";
    } else if (title.length < 3) {
      return "Title Required minimum 3 character";
    } else {
      return null;
    }
  }

  @protected
  String? isValidCharNum(String? name, String fieldName) {
    const pattern = r'^[a-zA-Z0-9_.-]*$';
    final regExp = RegExp(pattern);

    if (name == null || name.isEmpty) {
      return "$fieldName ${'cannot be empty'}";
    }

    if (!regExp.hasMatch(name.trim())) {
      return "${'Please enter a valid'} $fieldName";
    } else {
      return null;
    }
  }

  @protected
  String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    } else if (password.length < passwordMinLength) {
      return "${'Password should be at least'} $passwordMinLength ${'characters long'}";
    } else {
      return null;
    }
  }

  @protected
  String? isValidCnfPassword(String? password, String? pass2) {
    if (password == null || password.isEmpty) {
      return "Confirm Password cannot be empty";
    } else if (password != pass2) {
      return "Confirm Password must be same as password";
    } else {
      return null;
    }
  }

  @protected
  String? isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    }

    final isValid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email.trim());

    if (isValid) {
      return null;
    } else {
      return "Entered Email is not valid";
    }
  }

  @protected
  String? isConfirmPasswordValid(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm Password cannot be empty";
    }
    if (confirmPassword.trim() == password?.trim()) {
      return null;
    } else {
      return "Passwords do not match";
    }
  }

  @protected
  String? isValidName(String? name, String fieldName) {
    const pattern = r'^[a-z A-Z,.\-]+$';
    final regExp = RegExp(pattern);

    if (name == null || name.isEmpty) {
      return "$fieldName ${'cannot be empty'}";
    }

    if (!regExp.hasMatch(name.trim())) {
      return "${'Please enter a valid'} $fieldName";
    } else {
      return null;
    }
  }

  @protected
  String? isRequiredValid(String? name, String fieldName) {
    if (name == null || name.isEmpty) {
      return "$fieldName ${'cannot be empty'}";
    } else {
      return null;
    }
  }

  @protected
  String? isNotEmpty(String? value, String? fieldName) {
    if (value == null) {
      return "$fieldName ${'cannot be empty'}";
    } else if (value.trim().isEmpty) {
      return "$fieldName ${'cannot be empty'}";
    } else {
      return null;
    }
  }

  @protected
  String? isValidPhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone Number cannot be empty";
    } else {
      final phoneUnformatted = phone.replaceAll(RegExp("[()-]"), "");
      return phoneUnformatted.length > 8
          ? null
          : "Please Enter a valid phone number";
    }
  }
}
