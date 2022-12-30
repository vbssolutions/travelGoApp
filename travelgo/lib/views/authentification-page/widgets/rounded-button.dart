import 'package:flutter/material.dart';
import 'package:travelgo/views/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: KprimaryColor,
      ),
      child: TextButton(
        onPressed: null,
        child: Text(
          buttonName,
          style: GoogleFonts.roboto(
              fontSize: 22,
              color: Colors.white,
              height: 1.5,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
