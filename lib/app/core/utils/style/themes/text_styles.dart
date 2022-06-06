import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/general_colors.dart';

///O [TextStyles] é uma classe responsável por gerenciar e armazenar variádos
///tipos de estilização de textos.
class TextStyles {
  ///Método que retorna estilização de texto de forma customizável.
  ///
  ///Deve ser utilizado somente caso os outros métodos da
  ///classe [TextStyles] não contemplem a estilização de texto proposto no design.
  ///
  ///**Exemplo:**
  /// ```dart
  /// Text(
  ///   'texto',
  ///   style: TextStyles.custom(
  ///     color: kColorStatusActive,
  ///     fontWeight: FontWeight.bold,
  ///     fontSize: 13,
  ///    ),
  /// ),
  /// ```
  static TextStyle custom({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return GoogleFonts.dmSans(
      color: color ?? kColorTextLight,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontSize: fontSize ?? 12,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **Headline 1**.
  static TextStyle headline1({Color? color}) {
    return GoogleFonts.dmSans(
      color: color ?? kColorTextLight,
      fontWeight: FontWeight.w700,
      fontSize: 18,
     letterSpacing: -0.5,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **Headline 2**.
  static TextStyle headline2({Color? color}) {
    return GoogleFonts.dmSans(
      color: color ?? kColorTextLight,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      letterSpacing: 0.2,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **subtitle1**.
  static TextStyle subtitle1({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.dmSans(
      color: color ?? kColorTextLight,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: 10,
      letterSpacing: 0.1,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **BodyText 1**.
  static TextStyle bodyText1({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.dmSans(
      color: color ?? kColorTextLight,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.2,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **Helper**.
  static TextStyle helper({Color? color, double? fontSize}) {
    return GoogleFonts.dmSans(
      color: color ?? kColorTextLight,
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 16,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **Button**.
  static TextStyle button({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.dmSans(
      color: color ?? kColorTextLight,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: 10,
      letterSpacing: 0.04,
    );
  }
}
