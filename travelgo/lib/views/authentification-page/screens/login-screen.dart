import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/statics_values.dart';
import 'package:travelgo/services/authentication.dart';
import 'package:travelgo/views/authentification-page/screens/create-new-account.dart';
import 'package:travelgo/views/authentification-page/screens/forgot-password.dart';
import 'package:travelgo/views/authentification-page/widgets/background-image.dart';
import 'package:travelgo/views/authentification-page/widgets/password-input.dart';
import 'package:travelgo/views/authentification-page/widgets/text-field-input.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/homeview/homeview.dart';
import 'package:travelgo/views/pageManagement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  final String? email;
  final String? password;
  const LoginScreen({super.key, this.email, this.password});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userConnectedEMail = '';
  String userConnectedPassword = '';
  int userId = 0;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void initState() {
    super.initState();
    _emailController.text = widget.email != null ? widget.email! : '';
    _passwordController.text = widget.password != null ? widget.password! : '';
  }

  Future _login(BuildContext context) async {
    if (_emailController.text != "" && _passwordController.text != "") {
      AuthService _auth = AuthService();
      dynamic result = await _auth.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);

      if (result == null) {
      } else if (result ==
              "The password is invalid or the user does not have a password." ||
          result ==
              "We have blocked all requests from this device due to unusual activity. Try again later.") {
        Fluttertoast.showToast(
            msg: "Mot de passe incorrect.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[400]!.withOpacity(
              0.5,
            ),
            textColor: Colors.white,
            fontSize: 16.0);
        _btnController.reset();
      } else if (result == "The email address is badly formatted.") {
        Fluttertoast.showToast(
            msg: "Adresse email invalide.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[400]!.withOpacity(
              0.5,
            ),
            textColor: Colors.white,
            fontSize: 16.0);
        _btnController.reset();
      } else if (result ==
          "There is no user record corresponding to this identifier. The user may have been deleted.") {
        Fluttertoast.showToast(
            msg:
                "Cette adresse mail n'est pas enrolée.\nVeuillez vous enrolez.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[400]!.withOpacity(
              0.5,
            ),
            textColor: Colors.white,
            fontSize: 16.0);
        _btnController.reset();
      } else if (result == "") {
        Fluttertoast.showToast(
            msg: "Erreur de connexion.\nVérifier votre connexion internet.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[400]!.withOpacity(
              0.5,
            ),
            textColor: Colors.white,
            fontSize: 16.0);
        _btnController.reset();
      } else {
        _btnController.success();
        Fluttertoast.showToast(
            msg: "Connexion réussie",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[400]!.withOpacity(
              0.4,
            ),
            textColor: KprimaryColor,
            fontSize: 16.0);
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeftJoined,
                duration: Duration(milliseconds: 700),
                reverseDuration: Duration(milliseconds: 700),
                childCurrent: LoginScreen(),
                child: PageManagement(
                  user: result,
                )));
      }
    } else {
      Fluttertoast.showToast(
          msg:
              "Erreur de connexion\nVeuillez renseigner correctement les tous les champs",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red[400]!.withOpacity(
            0.5,
          ),
          textColor: Colors.white,
          fontSize: 16.0);
      _btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/img/login_bg.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'TravelGo',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 43,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    controller: _emailController,
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(
                    controller: _passwordController,
                    icon: FontAwesomeIcons.lock,
                    hint: 'Mot de passe',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftJoined,
                            duration: Duration(milliseconds: 700),
                            reverseDuration: Duration(milliseconds: 700),
                            childCurrent: LoginScreen(),
                            child: ForgotPassword())),
                    child: Text(
                      'Mot de passe oublié',
                      style: GoogleFonts.roboto(
                          fontSize: 22, color: Colors.white, height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                      child: Text('Se connecter',
                          style: GoogleFonts.roboto(
                              fontSize: 22,
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.bold)),
                      controller: _btnController,
                      onPressed: () {
                        _login(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeftJoined,
                        duration: Duration(milliseconds: 700),
                        reverseDuration: Duration(milliseconds: 700),
                        childCurrent: LoginScreen(),
                        child: CreateNewAccount())),
                child: Container(
                  child: Text(
                    "Pas encore de compte ? S'enroler",
                    style: GoogleFonts.roboto(
                        fontSize: 22, color: Colors.white, height: 1.5),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
