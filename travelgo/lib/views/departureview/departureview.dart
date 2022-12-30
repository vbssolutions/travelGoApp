import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/departureModel.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/ticketview/ticketview.dart';
import 'package:google_fonts/google_fonts.dart';

class DepartureView extends StatefulWidget {
  final Departure departure;

  const DepartureView({
    super.key,
    required this.departure,
  });

  @override
  State<DepartureView> createState() => _DepartureViewState();
}

class _DepartureViewState extends State<DepartureView> {
  void showTicket(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: KprimaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => TicketView(
              departure: widget.departure,
            ));
  }

  void showPassenger(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: KprimaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => EmployesView(
              departure: widget.departure,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: Kheight(context, 1),
          child: Column(children: [
            SizedBox(
              height: Kheight(context, 0.06),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Kheight(context, 0.015)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Color(0xFFa8b7c4),
                      ),
                    ),
                    InkWell(
                      child: FaIcon(
                        FontAwesomeIcons.solidBell,
                        color: Color(0XFFa8b7c4),
                      ),
                    )
                  ]),
            ),
            KspaceHeight(context),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Kheight(context, 0.015)),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: KprimaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: KWigth(context, 0.04),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/img/bank-vecteur.png"),
                            SizedBox(
                              width: KWigth(context, 0.01),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Désormais réserver  vos tickets confortablement de chez vous.",
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: Kheight(context, 0.005),
                                ),
                                Text(
                                  "Réserver maintenant et profiter d'une reduction de 100%.",
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: KWigth(context, 0.05),
                  )
                ],
              ),
            ),
            KspaceHeight(context),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Kheight(context, 0.015),
                  vertical: Kheight(context, 0.01)),
              padding: EdgeInsets.all(10),
              height: Kheight(context, 0.24),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/img/map.png")),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFe4e7eb), width: 2)),
            ),
            KspaceHeight(context),
            Container(
              margin: EdgeInsets.only(left: Kheight(context, 0.015)),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget
                                                  .departure.placeOfDeparture!,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF434a61)),
                                            ),
                                            SizedBox(
                                              height: Kheight(context, 0.005),
                                            ),
                                            Text(
                                              widget.departure
                                                      .departure_date![0]
                                                      .toString() +
                                                  " " +
                                                  widget
                                                      .departure.departure_hour
                                                      .toString() +
                                                  ":" +
                                                  widget.departure.departure_min
                                                      .toString(),
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15,
                                                  color: Color(0xFFa4a6af)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                backgroundColor:
                                                    Color(0xFFa4a6af),
                                                child: Center(
                                                    child: FaIcon(
                                                  FontAwesomeIcons.solidCircle,
                                                  color: Colors.white,
                                                  size: 11,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: Kheight(context, 0.03),
                                            ),
                                            Text(
                                              "Kaya",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF434a61)),
                                            ),
                                            SizedBox(
                                              height: Kheight(context, 0.005),
                                            ),
                                            Text(
                                              widget.departure
                                                      .departure_date![0]
                                                      .toString() +
                                                  " " +
                                                  widget
                                                      .departure.departure_hour
                                                      .toString() +
                                                  ":" +
                                                  widget.departure.departure_min
                                                      .toString(),
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15,
                                                  color: Color(0xFFa4a6af)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              FontAwesomeIcons.solidCircle,
                                              color: Color(0xFFedf0f6),
                                              size: 7,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
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
                                                backgroundColor:
                                                    Color(0xFFf76505),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: Kheight(context, 0.03),
                                            ),
                                            Text(
                                              widget.departure.destination!,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF434a61)),
                                            ),
                                            SizedBox(
                                              height: Kheight(context, 0.005),
                                            ),
                                            Text(
                                              widget.departure
                                                      .departure_date![0]
                                                      .toString() +
                                                  " " +
                                                  widget
                                                      .departure.departure_hour
                                                      .toString() +
                                                  ":" +
                                                  widget.departure.departure_min
                                                      .toString(),
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15,
                                                  color: Color(0xFFa4a6af)),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: KWigth(context, 0.1),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(
                          vertical: Kheight(context, 0.01)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          border:
                              Border.all(color: Color(0xFFe4e7eb), width: 2)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "05",
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF424a65),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("minute",
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF424a65),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: Kheight(context, 0.02),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Durée du trajet:",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13, color: Color(0xFFa4a6af)),
                                  children: [
                                    TextSpan(
                                        text: " 15 min",
                                        style: GoogleFonts.roboto(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF424a65)))
                                  ]),
                            ),
                            SizedBox(
                              height: Kheight(context, 0.02),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Place totale",
                                          style: GoogleFonts.roboto(
                                              fontSize: 13,
                                              color: Color(0xFFa4a6af)),
                                        ),
                                        Text(
                                          "Disponible  ",
                                          style: GoogleFonts.roboto(
                                              fontSize: 13,
                                              color: Color(0xFFa4a6af)),
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  height: Kheight(context, 0.01),
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FaIcon(
                                          widget.departure.vehicleType == "bus"
                                              ? FontAwesomeIcons.bus
                                              : (widget.departure.vehicleType ==
                                                      "car"
                                                  ? FontAwesomeIcons.carSide
                                                  : (widget.departure
                                                              .vehicleType ==
                                                          "plane"
                                                      ? FontAwesomeIcons.plane
                                                      : FontAwesomeIcons
                                                          .accessibleIcon)),
                                          size: 18,
                                          color: Color(0xFF424a65),
                                        ),
                                        SizedBox(
                                          width: KWigth(context, 0.02),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color(0xFFfe9f01)),
                                          child: Text(
                                            widget.departure.totalPlaces
                                                .toString(),
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: KWigth(context, 0.015),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.angleRight,
                                          color: Color(0xFFc9cbd0),
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: KWigth(context, 0.015),
                                        ),
                                        FaIcon(
                                          widget.departure.vehicleType == "bus"
                                              ? FontAwesomeIcons.bus
                                              : (widget.departure.vehicleType ==
                                                      "car"
                                                  ? FontAwesomeIcons.carSide
                                                  : (widget.departure
                                                              .vehicleType ==
                                                          "plane"
                                                      ? FontAwesomeIcons.plane
                                                      : FontAwesomeIcons
                                                          .accessibleIcon)),
                                          size: 18,
                                          color: Color(0xFF424a65),
                                        ),
                                        SizedBox(
                                          width: KWigth(context, 0.03),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color(0xFF03adff)),
                                          child: Text(
                                            widget.departure.availablePlaces
                                                .toString(),
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ]),
                                )
                              ],
                            )
                          ]),
                    ))
                  ]),
            ),
            SizedBox(
              height: Kheight(context, 0.04),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: Kheight(context, 0.015)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showPassenger(context);
                      },
                      child: Container(
                        child: Container(
                          height: 45,
                          width: 50,
                          decoration: BoxDecoration(
                              color: KprimaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: FaIcon(
                            FontAwesomeIcons.peopleGroup,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: KWigth(context, 0.03),
                    ),
                    Container(
                      child: Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFF03adfe),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.white,
                        )),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            showTicket(context);
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
                                "Voir le Ticket",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          )),
                    )
                  ]),
            )),
            SizedBox(
              height: Kheight(context, 0.01),
            )
          ]),
        ),
      ),
    );
  }
}

class EmployesView extends StatefulWidget {
  final Departure departure;
  const EmployesView({super.key, required this.departure});

  @override
  State<EmployesView> createState() => _EmployesViewState();
}

class _EmployesViewState extends State<EmployesView> {
  @override
  Widget build(BuildContext context) {
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
                      "Passagers",
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
            Center(
              child: Container(
                height: 30,
                width: KWigth(context, 0.2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                    child: Container(
                  height: 15,
                  width: 15,
                  child: CircleAvatar(
                    backgroundColor: KprimaryColor,
                  ),
                )),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.symmetric(horizontal: KWigth(context, 0.03)),
              height: Kheight(context, 0.75),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.departure.passengersList!.length,
                  itemBuilder: ((context, index) => ListTile(
                      leading: Text((index + 1).toString(),
                          style: GoogleFonts.roboto(
                              color: Color(0xFF434a61),
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      trailing: Text("B57678",
                          style: GoogleFonts.roboto(
                              color: Color(0xFF434a61),
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      title: Text(widget.departure.passengersList![index],
                          style: GoogleFonts.roboto(
                              color: Color(0xFF434a61),
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      onTap: () => print("ListTile")))),
            ),
            Center(
              child: Container(
                height: 10,
                width: KWigth(context, 0.2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ]),
        ));
  }
}
