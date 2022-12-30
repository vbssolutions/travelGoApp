import 'dart:ui';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/statics_values.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/ticketListview/widgets/ticketItem.dart';

import 'package:google_fonts/google_fonts.dart';

class MyTicketsview extends StatefulWidget {
  const MyTicketsview({
    super.key,
  });

  @override
  State<MyTicketsview> createState() => _MyTicketsviewState();
}

class _MyTicketsviewState extends State<MyTicketsview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: KprimaryColor,
            child: Column(
              children: [
                SizedBox(
                  height: Kheight(context, 0.06),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: KWigth(context, 0.03)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Mes tickets",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(""),
                      ]),
                ),
                SizedBox(
                  height: Kheight(context, 0.02),
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: notificationsList.isEmpty
                      ? Center(
                          child: Text(
                            "Aucun ticket",
                            style: GoogleFonts.roboto(
                                fontSize: 16, color: Color(0xFF434a61)),
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: notificationsList.length,
                          itemBuilder: ((context, index) => TicketItem())),
                ))
              ],
            )));
  }
}
