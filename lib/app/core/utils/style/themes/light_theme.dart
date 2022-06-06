import 'package:flutter/material.dart';

import '../colors/general_colors.dart';
import 'text_styles.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kColorBackgroundLight,
  errorColor: kColorStatusError,
  primaryColor: kColorStatusActive,
  inputDecorationTheme: _inputDecoration,
);

InputDecorationTheme _inputDecoration = InputDecorationTheme(
  hintStyle: TextStyles.helper(),
  disabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: kColorTextLight,
      width: 1,
    ),
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide(
      color: kColorTextLight,
      width: 1,
    ),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: kColorTextLight,
      width: 1,
    ),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: kColorStatusError,
      width: 1,
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: kColorStatusActive,
      width: 1,
    ),
  ),
);
