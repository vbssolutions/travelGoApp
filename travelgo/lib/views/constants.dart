import "package:flutter/material.dart";

Color KprimaryColor = Color(0xFF5cc594);

Color KsecondaryColor = Color(0xFFfa7b28);

double Kheight(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * value;
}

double KWigth(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * value;
}

SizedBox KspaceHeight(BuildContext context) {
  return SizedBox(
    height: Kheight(context, 0.05),
  );
}
