import "package:flutter/material.dart";

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:travelgo/views/constants.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketItem extends StatefulWidget {
  const TicketItem({super.key});

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  void showQrCode(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: Kheight(
                context,
                0.7,
              ),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: Kheight(context, 0.35),
                    width: Kheight(context, 0.35),
                    child: QrImage(
                      data:
                          "QR code de test, aucune informations n'est disponible pour le moment.",
                      version: QrVersions.auto,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Scanner le code QR",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Color(0xFF434a61)),
                  )
                ],
              )),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
          horizontal: KWigth(context, 0.03), vertical: Kheight(context, 0.01)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFe4e7eb), width: 2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Départ dans:",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Color(0xFFa4a6af)),
                  ),
                  SizedBox(
                    height: Kheight(context, 0.01),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "5",
                        style: GoogleFonts.roboto(
                            color: Color(0xFF424a65),
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: "min",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF424a65),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ]),
                  )
                ],
              ),
            ),
            SizedBox(
              width: KWigth(context, 0.02),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Heure de départ:",
                        style: GoogleFonts.roboto(
                            fontSize: 15, color: Color(0xFFa4a6af)),
                        children: [
                          TextSpan(
                              text: " 14h30",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF424a65)))
                        ]),
                  ),
                  SizedBox(
                    height: Kheight(context, 0.01),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Engin:",
                        style: GoogleFonts.roboto(
                            fontSize: 15, color: Color(0xFFa4a6af)),
                        children: [
                          TextSpan(
                              text: " BUSE090",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF424a65)))
                        ]),
                  ),
                  SizedBox(
                    height: Kheight(context, 0.01),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nombre de place",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFFa4a6af)),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: Kheight(context, 0.005),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.bus,
                                size: 20,
                                color: Color(0xFF424a65),
                              ),
                              SizedBox(
                                width: KWigth(context, 0.02),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFFfe9f01)),
                                child: Text(
                                  "30",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: Kheight(context, 0.02),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF03adff),
                                child: Center(
                                    child: FaIcon(
                                  FontAwesomeIcons.caretUp,
                                  color: Colors.white,
                                  size: 12,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFedf0f6),
                              size: 7,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: KWigth(context, 0.02),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Roxgold",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF434a61)),
                            ),
                            SizedBox(
                              height: Kheight(context, 0.005),
                            ),
                            Text(
                              "24 Nov 2022",
                              style: GoogleFonts.roboto(
                                  fontSize: 15, color: Color(0xFFa4a6af)),
                            )
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
            InkWell(
              onTap: () {
                showQrCode(context);
              },
              child: Container(
                child: Container(
                  width: KWigth(context, 0.4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: KsecondaryColor,
                  ),
                  child: TextButton(
                    onPressed: null,
                    child: Row(children: [
                      FaIcon(
                        FontAwesomeIcons.qrcode,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: KWigth(context, 0.03),
                      ),
                      Text(
                        "QR code",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFedf0f6),
                              size: 7,
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Container(
                              height: 10,
                              width: 17,
                            ),
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
            Container()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFedf0f6),
                              size: 7,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 17,
                              width: 17,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFf76505),
                                child: Center(
                                    child: FaIcon(
                                  FontAwesomeIcons.caretDown,
                                  color: Colors.white,
                                  size: 12,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: KWigth(context, 0.02),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Essakane, Kaya",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF434a61)),
                            ),
                            SizedBox(
                              height: Kheight(context, 0.005),
                            ),
                            Text(
                              "24 Nov 2022",
                              style: GoogleFonts.roboto(
                                  fontSize: 15, color: Color(0xFFa4a6af)),
                            )
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
            Container(
              child: Container(
                width: KWigth(context, 0.4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),
                child: TextButton(
                  onPressed: null,
                  child: Row(children: [
                    FaIcon(
                      FontAwesomeIcons.cancel,
                      color: Color.fromARGB(255, 83, 14, 14),
                    ),
                    SizedBox(
                      width: KWigth(context, 0.03),
                    ),
                    Text(
                      "Annuler",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
