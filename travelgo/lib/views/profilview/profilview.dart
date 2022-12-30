import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:travelgo/models/userModel.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/profilview/widgets/editProfil.dart';
import 'package:travelgo/views/profilview/widgets/profilElement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profilview extends StatefulWidget {
  final bool fromPageManagment;
  final User user;
  const Profilview(
      {super.key, required this.fromPageManagment, required this.user});

  @override
  State<Profilview> createState() => _ProfilviewState();
}

class _ProfilviewState extends State<Profilview> {
  optionsList() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(500, Kheight(context, 0.1), 5,
          20), //here you can specify the location,
      items: [
        PopupMenuItem(
          value: 0,
          onTap: () {},
          child: Container(
              child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.cog,
                size: 17,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Settings",
                style:
                    GoogleFonts.roboto(fontSize: 17, color: Color(0xFF434b64)),
              )
            ],
          )),
        ),
      ],
    ).then((value) {
      if (value == 0) {
      } else {}
    });
  }

  void editProfilModal(BuildContext context, User userData) {
    showModalBottomSheet(
        backgroundColor: Colors.black.withOpacity(0.7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => EditProfil(
              userData: userData,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  color: KprimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150))),
              height: Kheight(context, 0.3),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Kheight(context, 0.06),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: KWigth(context, 0.03)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.fromPageManagment
                                ? Container()
                                : InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.arrowLeft,
                                      color: Colors.white,
                                    ),
                                  ),
                            InkWell(
                              onTap: () {
                                optionsList();
                              },
                              child: FaIcon(
                                FontAwesomeIcons.ellipsisVertical,
                                color: Colors.white,
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: Kheight(context, 0.08),
                    ),
                    Center(
                      child: Text(
                        widget.user.displayName.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: Kheight(context, 0.05),
            ),
            ProfilElement(
              icon: FontAwesomeIcons.solidUser,
              label: widget.user.displayName.toString(),
              isPassword: false,
            ),
            ProfilElement(
              icon: FontAwesomeIcons.solidRegistered,
              label: "B76776",
              isPassword: false,
            ),
            ProfilElement(
              icon: FontAwesomeIcons.mobile,
              label: widget.user.phoneNumber.toString(),
              isPassword: false,
            ),
            ProfilElement(
              icon: FontAwesomeIcons.solidEnvelope,
              label: widget.user.email.toString(),
              isPassword: false,
            ),
            ProfilElement(
              icon: FontAwesomeIcons.eye,
              label: "password",
              isPassword: true,
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        editProfilModal(context, widget.user);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: Kheight(context, 0.005),
                            horizontal: KWigth(context, 0.025)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: KsecondaryColor,
                        ),
                        child: TextButton(
                          onPressed: null,
                          child: Text(
                            "Modifier mon profil",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: Kheight(context, 0.01),
            ),
          ]),
        ),
        Positioned(
            top: Kheight(context, 0.23),
            left: KWigth(context, 0.37),
            child: Stack(
              children: [
                Center(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: CircleAvatar(
                        radius: KWigth(context, 0.14),
                        backgroundColor: Color.fromARGB(255, 236, 232, 232),
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: KprimaryColor,
                          size: KWigth(context, 0.1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
