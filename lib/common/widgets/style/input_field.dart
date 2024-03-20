import 'package:flutter/material.dart';

InputDecoration inputDecoration(ThemeData theme) {
  return InputDecoration(
    errorMaxLines: 3,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: theme.primaryColor,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: theme.primaryColor,
        width: 2.0,
      ),
    ),
  );
}

TextStyle inputStyle(ThemeData theme) {
  return TextStyle(
    fontSize: 16,
    color: theme.primaryColor,
  );
}
