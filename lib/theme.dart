import 'package:flutter/material.dart';

class LauncherTheme
{
  final String name;

  final Color background;
  final Color background2;
  final Color iconbg;
  final Color accent;
  final Color highlight;
  final Color highlightFade;
  final Color highlightFontColor;
  final Color fontColor;

  const LauncherTheme({
    required this.name,
    required this.background,
    required this.background2,
    required this.iconbg,
    required this.accent,
    required this.highlight,
    required this.highlightFade,
    required this.highlightFontColor,
    required this.fontColor,
    });
}

LauncherTheme basicWhite = const LauncherTheme(
  name: "Basic White",
  background: Color.fromARGB(255, 232, 232, 232),
  background2: Color.fromARGB(255, 238, 238, 238),
  iconbg: Color.fromARGB(255, 255, 255, 255),
  accent: Color.fromARGB(255, 35, 73, 234),
  highlight: Color.fromARGB(255, 90, 240, 240),
  highlightFade: Color.fromARGB(255, 50, 197, 227),
  highlightFontColor: Color.fromARGB(255, 90, 240, 240),
  fontColor: Color.fromARGB(255, 40, 40, 40)
);

LauncherTheme basicBlack = const LauncherTheme(
  name: "Basic White",
  background: Color.fromARGB(255, 40, 40, 40),
  background2: Color.fromARGB(255, 44, 44, 44),
  iconbg: Color.fromARGB(255, 70, 70, 70),
  accent: Color.fromARGB(255, 0, 254, 190),
  highlight: Color.fromARGB(255, 90, 240, 240),
  highlightFade: Color.fromARGB(255, 50, 197, 227),
  highlightFontColor: Color.fromARGB(255, 0, 180, 232),
  fontColor: Color.fromARGB(255, 255, 255, 255)
);

