import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/statics_values.dart';
import 'package:travelgo/views/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../widgets/background-image.dart';

import '../widgets/text-field-input.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  TextEditingController _emailController = TextEditingController();
  String userConnectedEMail = '';
  Future _restorePassword(BuildContext context) async {
    if (_emailController.text != "") {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());

        _btnController.success();
        Fluttertoast.showToast(
            msg: "Verifier votre boite mail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[400]!.withOpacity(
              0.4,
            ),
            textColor: KprimaryColor,
            fontSize: 16.0);
      } on FirebaseAuthException catch (e) {
        if (e.message.toString() ==
            "There is no user record corresponding to this identifier. The user may have been deleted.") {
          _btnController.reset();
          Fluttertoast.showToast(
              msg: "Cette adresse mail n'est pas enrolée.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red[400]!.withOpacity(
                0.4,
              ),
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (e.message.toString() ==
            "The email address is badly formatted.") {
          _btnController.reset();
          Fluttertoast.showToast(
              msg: "Entrer une adresse mail valide.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red[400]!.withOpacity(
                0.4,
              ),
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: "Erreur de connexion.\nVérifier votre connexion internet.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red[400]!.withOpacity(
                0.4,
              ),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    } else {
      _btnController.reset();
      Fluttertoast.showToast(
          msg: "Veuillez entrer une adresse mail.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[400]!.withOpacity(
            0.4,
          ),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/img/login_bg.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Mot de passe oublié',
              style: GoogleFonts.roboto(
                  fontSize: 22, color: Colors.white, height: 1.5),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        'Entrer votre adresse email pour recevoir des instructions de réinitialisation de votre mot de passe',
                        style: GoogleFonts.roboto(
                            fontSize: 22, color: Colors.white, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextInputField(
                      controller: _emailController,
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: Kheight(context, 0.08),
                      width: KWigth(context, 0.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: RoundedLoadingButton(
                        successColor: KprimaryColor,
                        color: KsecondaryColor,
                        borderRadius: 16,
                        height: Kheight(context, 0.08),
                        width: KWigth(context, 0.8),
                        child: Text('Recevoir le email',
                            style: GoogleFonts.roboto(
                                fontSize: 22,
                                color: Colors.white,
                                height: 1.5,
                                fontWeight: FontWeight.bold)),
                        controller: _btnController,
                        onPressed: () {
                          _restorePassword(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
