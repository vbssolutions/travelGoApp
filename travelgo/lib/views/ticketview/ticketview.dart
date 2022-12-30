import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/departureModel.dart';
import 'package:travelgo/models/statics_values.dart';
import 'package:travelgo/models/userModel.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/ticketview/widgets/linearProgressBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TicketView extends StatefulWidget {
  final Departure departure;

  const TicketView({
    super.key,
    required this.departure,
  });

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: Kheight(context, 1),
          child: Column(children: [
            SizedBox(
              height: Kheight(context, 0.06),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: KWigth(context, 0.03)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      "Ticket",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.close,
                        color: KsecondaryColor,
                        size: 35,
                      ),
                    )
                  ]),
            ),
            KspaceHeight(context),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: KWigth(context, 0.03)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: KWigth(context, 0.04)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    width: 17,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xFF03adff),
                                                      child: Center(
                                                          child: FaIcon(
                                                        FontAwesomeIcons
                                                            .caretUp,
                                                        color: Colors.white,
                                                        size: 12,
                                                      )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: Color(0xFFedf0f6),
                                                    size: 7,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: Color(0xFFedf0f6),
                                                    size: 7,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: KWigth(context, 0.02),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.departure
                                                        .placeOfDeparture!,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF434a61)),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        Kheight(context, 0.005),
                                                  ),
                                                  Text(
                                                    widget.departure
                                                            .departure_date![0]
                                                            .toString() +
                                                        " " +
                                                        widget.departure
                                                            .departure_hour
                                                            .toString() +
                                                        ":" +
                                                        widget.departure
                                                            .departure_min
                                                            .toString(),
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFFa4a6af)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                  Container()
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
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
                                                      backgroundColor:
                                                          Color(0xFFf76505),
                                                      child: Center(
                                                          child: FaIcon(
                                                        FontAwesomeIcons
                                                            .caretDown,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        Kheight(context, 0.01),
                                                  ),
                                                  Text(
                                                    widget
                                                        .departure.destination!,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF434a61)),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        Kheight(context, 0.005),
                                                  ),
                                                  Text(
                                                    widget.departure
                                                            .departure_date![0]
                                                            .toString() +
                                                        " " +
                                                        widget.departure
                                                            .departure_hour
                                                            .toString() +
                                                        ":" +
                                                        widget.departure
                                                            .departure_min
                                                            .toString(),
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFFa4a6af)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                ],
                              )
                            ]),
                          ),
                          Container(
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                children: List.generate(
                                  Kheight(context, 0.13) ~/ (10 + 5),
                                  (_) => Container(
                                    width: 2,
                                    height: 10,
                                    color: Color(0xFFf0f1f3),
                                    margin: EdgeInsets.only(
                                        top: 10 / 2, bottom: 5 / 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                      text: "05",
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
                                ),
                                SizedBox(
                                  height: Kheight(context, 0.007),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Durée du trajet:",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          color: Color(0xFFa4a6af)),
                                      children: [
                                        TextSpan(
                                          text: " 15 min",
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 15,
                        width: 10,
                        decoration: BoxDecoration(
                            color: KprimaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              KWigth(context, 0.75) ~/ (10 + 5),
                              (_) => Container(
                                width: 10,
                                height: 2,
                                color: Color(0xFFf0f1f3),
                                margin:
                                    EdgeInsets.only(left: 10 / 2, right: 5 / 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                        width: 10,
                        decoration: BoxDecoration(
                            color: KprimaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Kheight(context, 0.03),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: KWigth(context, 0.04)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Passager",
                                style: GoogleFonts.roboto(
                                    fontSize: 17, color: Color(0xFFa4a6af)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.01),
                              ),
                              Text(
                                userData.surname! + " " + userData.name!,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF6f7380)),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.SCALE,
                                dialogType: DialogType.noHeader,
                                body: Column(children: [
                                  Text(
                                    "Ajout de passager",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: Kheight(context, 0.01),
                                  ),
                                  Container(
                                      height: Kheight(context, 0.4),
                                      child: ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal:
                                                          KWigth(context, 0.02),
                                                      vertical: Kheight(
                                                          context, 0.02)),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Kinda Harouna")
                                                      ]),
                                                ),
                                              )))
                                ]),
                                title: "Ajout de passager",
                                btnOkColor: Colors.red,
                              )..show();
                            },
                            child: Container(
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xFF03adfe),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: Kheight(context, 0.07),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: KWigth(context, 0.04),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: GoogleFonts.roboto(
                                    fontSize: 17, color: Color(0xFFa4a6af)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.01),
                              ),
                              Text(
                                widget.departure.departure_date![0].toString(),
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF6f7380)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.04),
                              ),
                              Text(
                                "Siège",
                                style: GoogleFonts.roboto(
                                    fontSize: 17, color: Color(0xFFa4a6af)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.01),
                              ),
                              Text(
                                "12",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF6f7380)),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bonus",
                                style: GoogleFonts.roboto(
                                    fontSize: 17, color: Color(0xFFa4a6af)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.01),
                              ),
                              Text(
                                "Remise",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF6f7380)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.04),
                              ),
                              Text(
                                "Tickets",
                                style: GoogleFonts.roboto(
                                    fontSize: 17, color: Color(0xFFa4a6af)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.01),
                              ),
                              Text(
                                "1",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF6f7380)),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Engin",
                                style: GoogleFonts.roboto(
                                    fontSize: 17, color: Color(0xFFa4a6af)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.01),
                              ),
                              Text(
                                widget.departure.vehicleName!,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF6f7380)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.04),
                              ),
                              Text(
                                "Heure d'arrivé",
                                style: GoogleFonts.roboto(
                                    fontSize: 17, color: Color(0xFFa4a6af)),
                              ),
                              SizedBox(
                                height: Kheight(context, 0.01),
                              ),
                              Text(
                                "14:00",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF6f7380)),
                              ),
                            ],
                          )
                        ]),
                  ),
                  SizedBox(
                    height: Kheight(context, 0.06),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: KWigth(context, 0.03),
                    ),
                    height: Kheight(context, 0.08),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/img/code-bare.png"))),
                  ),
                  SizedBox(
                    height: Kheight(context, 0.01),
                  ),
                  Text(
                    "4 2 7 3 8 4 G 7 3 E 4 8 9 3 H E 8 3 G R 0",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: Color(0xFFa4a6af)),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(
                        child: ProgressBar(
                            max: KWigth(context, 0.808), current: 50),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Kheight(context, 0.01),
                  ),
                ]),
              ),
            )
          ]),
        ));
  }
}
