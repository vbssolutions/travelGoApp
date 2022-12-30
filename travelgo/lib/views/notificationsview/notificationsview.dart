import 'dart:ui';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/statics_values.dart';
import 'package:travelgo/views/constants.dart';

import 'package:google_fonts/google_fonts.dart';

class Notificationsview extends StatefulWidget {
  const Notificationsview({
    super.key,
  });

  @override
  State<Notificationsview> createState() => _NotificationsviewState();
}

class _NotificationsviewState extends State<Notificationsview> {
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
                          "Notifications",
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
                            "Aucune notification",
                            style: GoogleFonts.roboto(
                                fontSize: 16, color: Color(0xFF434a61)),
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: notificationsList.length,
                          itemBuilder: ((context, index) => Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.01)),
                                margin: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.02)),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 200, 205, 219)))),
                                child: Column(children: [
                                  Row(children: [
                                    SizedBox(
                                      width: KWigth(context, 0.04),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                            height: 50,
                                            width: 50,
                                            child: CircleAvatar(
                                                backgroundColor: Color.fromARGB(
                                                    255, 241, 238, 238),
                                                child: FaIcon(notificationsList[
                                                                index]
                                                            .notificationType ==
                                                        "rappel"
                                                    ? FontAwesomeIcons.bus
                                                    : (notificationsList[index]
                                                                .notificationType ==
                                                            "réservation"
                                                        ? FontAwesomeIcons
                                                            .ticket
                                                        : FontAwesomeIcons
                                                            .info)))),
                                        Positioned(
                                            left: KWigth(context, 0.083),
                                            top: Kheight(context, 0.041),
                                            child: ClipOval(
                                              child: Container(
                                                  padding: EdgeInsets.all(1),
                                                  height: 19,
                                                  width: 19,
                                                  color: Colors.white,
                                                  child: CircleAvatar(
                                                      backgroundColor: (notificationsList[index]
                                                                  .notificationType ==
                                                              "rappel"
                                                          ? Colors.orange
                                                          : (notificationsList[index]
                                                                      .notificationType ==
                                                                  "réservation"
                                                              ? Colors.green
                                                              : Colors.red)),
                                                      child: FaIcon(
                                                          (notificationsList[index]
                                                                      .notificationType ==
                                                                  "rappel"
                                                              ? FontAwesomeIcons
                                                                  .clock
                                                              : (notificationsList[index].notificationType ==
                                                                      "réservation"
                                                                  ? FontAwesomeIcons
                                                                      .check
                                                                  : FontAwesomeIcons
                                                                      .newspaper)),
                                                          size: 10,
                                                          color: Colors.white))),
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      width: KWigth(context, 0.05),
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        notificationsList[index]
                                            .notificationBody
                                      ],
                                    )),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 13),
                                    )
                                  ]),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          notificationsList[index].date,
                                          style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF424a65)),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                              ))),
                ))
              ],
            )));
  }
}
