import 'package:awesome_dialog/awesome_dialog.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/profilview/widgets/passwordChangingModal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ProfilElement extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPassword;
  ProfilElement(
      {super.key,
      required this.icon,
      required this.label,
      required this.isPassword});

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Kheight(context, 0.01)),
      margin: EdgeInsets.symmetric(vertical: Kheight(context, 0.02)),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFF424a65)))),
      child: Row(children: [
        SizedBox(
          width: KWigth(context, 0.05),
        ),
        FaIcon(
          icon,
          color: Color.fromARGB(255, 69, 80, 114),
        ),
        SizedBox(
          width: KWigth(context, 0.05),
        ),
        Text(
          label,
          style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF424a65)),
        ),
        if (isPassword == true) Expanded(child: Container()),
        if (isPassword == true)
          InkWell(
            onTap: () {
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.noHeader,
                body: PasswordChangingModal(),
                title: "Changement de mot de passe",
                btnOkColor: Colors.red,
              )..show();
            },
            child: FaIcon(FontAwesomeIcons.pencil),
          ),
        if (isPassword == true)
          SizedBox(
            width: KWigth(context, 0.04),
          )
      ]),
    );
  }
}
