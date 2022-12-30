import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/statics_values.dart';
import 'package:travelgo/models/userModel.dart';
import 'package:travelgo/views/authentification-page/widgets/widgets.dart';
import 'package:travelgo/views/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditProfil extends StatefulWidget {
  final User userData;
  const EditProfil({super.key, required this.userData});

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _matriculeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void initState() {
    super.initState();
    /*  _nameController.text = widget.userData.name!;
    _surnameController.text = widget.userData.surname!;
    _matriculeController.text = widget.userData.matricule!;
    _phoneController.text = widget.userData.phone!;
    _emailController.text = widget.userData.email!; */
  }

  void _editProfil(BuildContext context) async {
    if (_emailController.text != "" &&
        _nameController.text != "" &&
        _surnameController.text != "" &&
        _matriculeController.text != "" &&
        _phoneController.text != "") {
      Timer(Duration(seconds: 3), () {
        _btnController.success();
        Fluttertoast.showToast(
            msg: "Profil mis à jour",
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
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: KWigth(context, 0.1),
              ),
              Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: CircleAvatar(
                          radius: KWigth(context, 0.14),
                          backgroundColor: Colors.grey[400]!.withOpacity(
                            0.4,
                          ),
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                            size: KWigth(context, 0.1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Kheight(context, 0.08),
                    left: KWigth(context, 0.56),
                    child: Container(
                      height: KWigth(context, 0.1),
                      width: KWigth(context, 0.1),
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
                height: KWigth(context, 0.1),
              ),
              Column(
                children: [
                  TextInputField(
                    controller: _nameController,
                    icon: FontAwesomeIcons.user,
                    hint: "Nom",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                  ),
                  TextInputField(
                    controller: _surnameController,
                    icon: FontAwesomeIcons.user,
                    hint: "Prénom",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                  ),
                  TextInputField(
                    controller: _matriculeController,
                    icon: FontAwesomeIcons.registered,
                    hint: "N* Matricule",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                  ),
                  TextInputField(
                    controller: _phoneController,
                    icon: FontAwesomeIcons.mobile,
                    hint: "Téléphone",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                  ),
                  TextInputField(
                    controller: _emailController,
                    icon: FontAwesomeIcons.envelope,
                    hint: "Email",
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
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
                      child: Text("Enregistrer",
                          style: GoogleFonts.roboto(
                              fontSize: 22,
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.bold)),
                      controller: _btnController,
                      onPressed: () {
                        _editProfil(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
