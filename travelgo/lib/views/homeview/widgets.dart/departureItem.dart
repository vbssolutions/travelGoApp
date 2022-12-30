import 'dart:async';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/departureModel.dart';
import 'package:travelgo/views/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DepartureItem extends StatefulWidget {
  final Departure departure;
  const DepartureItem({super.key, required this.departure});

  @override
  State<DepartureItem> createState() => _DepartureItemState();
}

class _DepartureItemState extends State<DepartureItem> {
  String _timeString = '';
  String _departure_on = '';

  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String hour = DateFormat('kk').format(now);
    final String min = DateFormat('mm').format(now);
    final String formattedDateTime = _formatDateTime(now);
    setStateIfMounted(() {
      _timeString = formattedDateTime;
      _departure_on = ((((widget.departure.departure_hour! * 60) +
                          widget.departure.departure_min!) -
                      ((int.parse(hour) * 60) + int.parse(min))) /
                  60)
              .toString()
              .split('.')
              .first +
          (((((widget.departure.departure_hour! * 60) +
                              widget.departure.departure_min!) -
                          ((int.parse(hour) * 60) + int.parse(min))) /
                      60) ==
                  0
              ? ''
              : ":") +
          ((((widget.departure.departure_hour! * 60) +
                          widget.departure.departure_min!) -
                      ((int.parse(hour) * 60) + int.parse(min))) %
                  60)
              .toString();
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('kk:mm').format(dateTime);
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: Kheight(context, 0.01)),
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
                        text: _departure_on,
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
                        text: "Durée du trajet:",
                        style: GoogleFonts.roboto(
                            fontSize: 15, color: Color(0xFFa4a6af)),
                        children: [
                          TextSpan(
                              text: " ... min",
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
                                widget.departure.departure_hour.toString() +
                                    ":" +
                                    widget.departure.departure_min.toString(),
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
                                widget.departure.vehicleType == "bus"
                                    ? FontAwesomeIcons.bus
                                    : (widget.departure.vehicleType == "car"
                                        ? FontAwesomeIcons.carSide
                                        : (widget.departure.vehicleType ==
                                                "plane"
                                            ? FontAwesomeIcons.plane
                                            : FontAwesomeIcons.accessibleIcon)),
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
                                  widget.departure.totalPlaces.toString(),
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: KWigth(context, 0.02),
                              ),
                              FaIcon(
                                FontAwesomeIcons.angleRight,
                                color: Color(0xFFc9cbd0),
                                size: 15,
                              ),
                              SizedBox(
                                width: KWigth(context, 0.02),
                              ),
                              FaIcon(
                                widget.departure.vehicleType == "bus"
                                    ? FontAwesomeIcons.bus
                                    : (widget.departure.vehicleType == "car"
                                        ? FontAwesomeIcons.carSide
                                        : (widget.departure.vehicleType ==
                                                "plane"
                                            ? FontAwesomeIcons.plane
                                            : FontAwesomeIcons.accessibleIcon)),
                                size: 20,
                                color: Color(0xFF424a65),
                              ),
                              SizedBox(
                                width: KWigth(context, 0.03),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFF03adff)),
                                child: Text(
                                  widget.departure.availablePlaces.toString(),
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
            SizedBox(
              width: KWigth(context, 0.02),
            ),
            Text(
              _timeString,
              style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16a7ed)),
            )
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
                              widget.departure.placeOfDeparture!,
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF434a61)),
                            ),
                            SizedBox(
                              height: Kheight(context, 0.005),
                            ),
                            Text(
                              widget.departure.departure_date![0].toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 15, color: Color(0xFFa4a6af)),
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
                              widget.departure.departure_date![0].toString(),
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
                  color: KprimaryColor,
                ),
                child: TextButton(
                  onPressed: null,
                  child: Row(children: [
                    FaIcon(
                      FontAwesomeIcons.cartArrowDown,
                      color: Color(0xFF178150),
                    ),
                    SizedBox(
                      width: KWigth(context, 0.03),
                    ),
                    Text(
                      "Ticket: " + widget.departure.availablePlaces.toString(),
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
