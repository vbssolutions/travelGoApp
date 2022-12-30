import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/services/authentication.dart';
import 'package:travelgo/services/db.dart';
import 'package:travelgo/views/authentification-page/screens/login-screen.dart';
import 'package:travelgo/views/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../widgets/widgets.dart';

class CreateNewAccount extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _matriculeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _register(BuildContext context) async {
    if (_emailController.text != "" &&
        _passwordController.text != "" &&
        _nameController.text != "" &&
        _surnameController.text != "" &&
        _matriculeController.text != "" &&
        _phoneController.text != "" &&
        _confirmPasswordController.text != "") {
      AuthService _auth = AuthService();
      dynamic result = await _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _matriculeController.text,
          _nameController.text,
          _passwordController.text,
          _phoneController.text,
          _surnameController.text);

      if (result == null) {
      } else if (result ==
          "The email address is already in use by another account.") {
        Fluttertoast.showToast(
            msg:
                "Cette adresse mail est déjà enrolée.\nVeuillez vous connectez directement.",
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
            msg: "Enrolement réussi",
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
                type: PageTransitionType.leftToRightPop,
                duration: Duration(milliseconds: 700),
                reverseDuration: Duration(milliseconds: 700),
                childCurrent: CreateNewAccount(),
                child: LoginScreen(
                  email: _emailController.text,
                  password: _passwordController.text,
                )));
      }
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
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/img/register_bg.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: KsecondaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      controller: _nameController,
                      icon: FontAwesomeIcons.user,
                      hint: 'Nom',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: _surnameController,
                      icon: FontAwesomeIcons.user,
                      hint: 'Prénom',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: _matriculeController,
                      icon: FontAwesomeIcons.registered,
                      hint: 'N* Matricule',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: _phoneController,
                      icon: FontAwesomeIcons.mobile,
                      hint: 'Téléphone',
                      inputType: TextInputType.phone,
                      inputAction: TextInputAction.next,
                    ),
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
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      controller: _confirmPasswordController,
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirmer Mot de passe',
                      inputAction: TextInputAction.done,
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
                        child: Text("S'enroler",
                            style: GoogleFonts.roboto(
                                fontSize: 22,
                                color: Colors.white,
                                height: 1.5,
                                fontWeight: FontWeight.bold)),
                        controller: _btnController,
                        onPressed: () {
                          _register(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "J'ai déjà un compte?",
                          style: GoogleFonts.roboto(
                              fontSize: 22, color: Colors.white, height: 1.5),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            ' Se Connecter',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
