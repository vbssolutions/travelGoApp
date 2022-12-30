import 'dart:async';

import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

import 'package:travelgo/views/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class PasswordChangingModal extends StatefulWidget {
  const PasswordChangingModal({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordChangingModal> createState() => _PasswordChangingModalState();
}

class _PasswordChangingModalState extends State<PasswordChangingModal> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _oldPassword = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  String oldPassword = "";
  void initState() {
    super.initState();
  }

  void _changePassword(BuildContext context) async {
    if (_password.text != "" &&
        _confirmPassword.text != "" &&
        _oldPassword.text != "") {
      Timer(Duration(seconds: 3), () {
        _btnController.success();
        Fluttertoast.showToast(
            msg: "Mot de passe changé",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[400]!.withOpacity(
              0.4,
            ),
            textColor: KprimaryColor,
            fontSize: 16.0);
        Navigator.pop(context);
      });
    } else {
      Fluttertoast.showToast(
          msg: "Veuillez remplir correctement tous les champs",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red[400]!.withOpacity(
            1,
          ),
          textColor: Colors.white,
          fontSize: 16.0);
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Changement de mot de passe",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 20, color: Color(0xFF424a65)),
          ),
          SizedBox(
            height: Kheight(context, 0.01),
          ),
          Container(
            width: 300,
            child: TextFormField(
                controller: _oldPassword,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    hintText: "Ancien mot de passe")),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            child: TextFormField(
                controller: _password,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    hintText: "Nouveau mot de passe")),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            child: TextFormField(
                controller: _confirmPassword,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    hintText: "Confirmer mot de passe")),
          ),
          SizedBox(
            height: 15,
          ),
          RoundedLoadingButton(
            successColor: KprimaryColor,
            color: KsecondaryColor,
            borderRadius: 16,
            child: Text('Valider',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.5,
                    fontWeight: FontWeight.bold)),
            controller: _btnController,
            onPressed: () {
              _changePassword(context);
            },
          ),
        ],
      ),
    );
  }
}
