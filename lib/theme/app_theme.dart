import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Paleta del portafolio: oscuro sobrio con acento ámbar (identidad LV).
class AppColors {
  static const bg = Color(0xFF17181F);
  static const surface = Color(0xFF20222B);
  static const surface2 = Color(0xFF282A35);
  static const line = Color(0xFF333644);
  static const lineHover = Color(0xFF4A4D5E);
  static const fg = Color(0xFFEEEBE3);
  static const muted = Color(0xFFA3A4B1);
  static const faint = Color(0xFF6F7182);
  static const accent = Color(0xFFFFAF29);
  static const accentHover = Color(0xFFFFC25C);
  static const onAccent = Color(0xFF17181F);
  static const tile = Color(0xFFEFEBE2);
  static const ok = Color(0xFF5BD49A);
}

/// Tres familias: Bricolage Grotesque (títulos), Instrument Sans (texto)
/// y JetBrains Mono (etiquetas y datos).
class AppText {
  static TextStyle display(
    double size, {
    FontWeight weight = FontWeight.w800,
    Color color = AppColors.fg,
    double height = 1.05,
    double? letterSpacing,
  }) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
        letterSpacing: letterSpacing ?? -size * 0.025,
      );

  static TextStyle body(
    double size, {
    Color color = AppColors.muted,
    FontWeight weight = FontWeight.w400,
    double height = 1.6,
  }) =>
      GoogleFonts.instrumentSans(
        fontSize: size,
        color: color,
        fontWeight: weight,
        height: height,
      );

  static TextStyle mono(
    double size, {
    Color color = AppColors.muted,
    FontWeight weight = FontWeight.w400,
    double letterSpacing = 0.3,
  }) =>
      GoogleFonts.jetBrainsMono(
        fontSize: size,
        color: color,
        fontWeight: weight,
        letterSpacing: letterSpacing,
        height: 1.4,
      );

  /// Etiqueta pequeña en mayúsculas sobre cada título de sección.
  static TextStyle eyebrow({Color color = AppColors.accent}) =>
      mono(12, color: color, weight: FontWeight.w500, letterSpacing: 1.7);
}

class Breakpoints {
  /// Por debajo de este ancho se oculta el menú superior.
  static const double mobile = 760;

  /// Por debajo de este ancho las columnas se apilan.
  static const double tablet = 860;

  static const double maxContent = 1120;
}

/// Limita un valor entre [min] y [max] (equivalente a clamp() de CSS).
double fluid(double value, double min, double max) =>
    value.clamp(min, max).toDouble();

ThemeData buildAppTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accent,
      onPrimary: AppColors.onAccent,
      surface: AppColors.surface,
      onSurface: AppColors.fg,
    ),
    textTheme: GoogleFonts.instrumentSansTextTheme(base.textTheme).apply(
      bodyColor: AppColors.fg,
      displayColor: AppColors.fg,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColors.accent.withValues(alpha: 0.3),
      cursorColor: AppColors.accent,
    ),
  );
}
