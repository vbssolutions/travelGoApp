import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelgo/models/departureModel.dart';
import 'package:travelgo/models/statics_values.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/homeview/widgets.dart/departureItem.dart';
import 'package:travelgo/views/departureview/departureview.dart';

import 'package:travelgo/views/profilview/profilview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Homeview extends StatefulWidget {
  final User user;
  const Homeview({super.key, required this.user});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  String week = weekList[0];
  int weekId = 0;
  String goTo = destinationsList[0];
  String comeFrom = departureOfLocationList[0];
  String changeLocation = "";
  int dayId = 1;
  bool launchSearch = false;

  void initState() {
    super.initState();
  }

  Future<void> refreshDeparture() async {}

  goToList() {
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(KWigth(context, 0.01),
            Kheight(context, 0.38), 5, 1), //here you can specify the location,
        items: List.generate(
          destinationsList.length,
          (index) => PopupMenuItem(
            value: index,
            onTap: () {},
            child: Container(
                child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.mapMarked,
                  size: 17,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  destinationsList[index],
                  style: GoogleFonts.roboto(
                      fontSize: 17, color: Color(0xFF434b64)),
                )
              ],
            )),
          ),
        )).then((value) {
      if (value != null) {
        setState(() {
          goTo = destinationsList[value];
        });
      }
    });
  }

  comeFromList() {
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(KWigth(context, 0.01),
            Kheight(context, 0.3), 5, 1), //here you can specify the location,
        items: List.generate(
          departureOfLocationList.length,
          (index) => PopupMenuItem(
            value: index,
            onTap: () {},
            child: Container(
                child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.mapMarked,
                  size: 17,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  departureOfLocationList[index],
                  style: GoogleFonts.roboto(
                      fontSize: 17, color: Color(0xFF434b64)),
                )
              ],
            )),
          ),
        )).then((value) {
      if (value != null) {
        setState(() {
          comeFrom = departureOfLocationList[value];
        });
      }
    });
  }

  chooseWeek() {
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(500, Kheight(context, 0.15), 5,
            20), //here you can specify the location,
        items: List.generate(
          weekList.length,
          (index) => PopupMenuItem(
            value: index,
            child: Container(
                child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.calendarWeek,
                  size: 17,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  weekList[index],
                  style: GoogleFonts.roboto(
                      fontSize: 17, color: Color(0xFF434b64)),
                )
              ],
            )),
          ),
        )).then((value) {
      if (value != null) {
        setState(() {
          week = weekList[value];
          weekId = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final departuresList = Provider.of<List<Departure>>(context);
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: Kheight(context, 1),
            color: KprimaryColor,
            child: Column(children: [
              SizedBox(
                height: Kheight(context, 0.06),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: Kheight(context, 0.015)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.scale,
                                  duration: Duration(milliseconds: 700),
                                  reverseDuration: Duration(milliseconds: 700),
                                  alignment: Alignment.bottomCenter,
                                  child: Profilview(
                                    user: widget.user,
                                    fromPageManagment: false,
                                  )));
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: FaIcon(
                          FontAwesomeIcons.solidBell,
                          color: Colors.white,
                        ),
                      )
                    ]),
              ),
              KspaceHeight(context),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: Kheight(context, 0.015)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(children: [
                          Text(
                            "Départ pour: ",
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          InkWell(
                            onTap: () {
                              chooseWeek();
                            },
                            child: Container(
                              child: Row(children: [
                                Text(
                                  week,
                                  style: GoogleFonts.roboto(
                                      fontSize: 17, color: Colors.white),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.caretDown,
                                  size: 13,
                                  color: Colors.white,
                                )
                              ]),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        child: Container(
                          child: Row(children: [
                            Text(
                              "Filtrer  ",
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            FaIcon(
                              FontAwesomeIcons.cog,
                              color: Colors.white.withOpacity(0.7),
                            )
                          ]),
                        ),
                      )
                    ]),
              ),
              KspaceHeight(context),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: Kheight(context, 0.015)),
                padding: EdgeInsets.all(Kheight(context, 0.015)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Column(children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xFF16a7ed),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: Color(0xFFdaf2ff),
                                                    size: 10,
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color: Color(0xFFdaf2ff),
                                              size: 7,
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color: Color(0xFFdaf2ff),
                                              size: 7,
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color: Color(0xFFdaf2ff),
                                              size: 7,
                                            ),
                                          ]),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            comeFromList();
                                          },
                                          child: Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "De",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFFbec5cf)),
                                                  ),
                                                  Text(
                                                    comeFrom,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF434a61)),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 3,
                                                    width: KWigth(context, 0.6),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: []),
                                                    color: Color(0xFFedeeef),
                                                  )
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Column(children: [
                                            FaIcon(
                                              FontAwesomeIcons.solidCircle,
                                              color: Color(0xFFdaf2ff),
                                              size: 7,
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Container(
                                              height: 20,
                                              width: 20,
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xFFf76505),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: Color(0xFFdaf2ff),
                                                    size: 10,
                                                  )),
                                            ),
                                            Text(
                                              "",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF434a61)),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            goToList();
                                          },
                                          child: Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Pour",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFFbec5cf)),
                                                  ),
                                                  Text(
                                                    goTo,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF434a61)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFeff3f9),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: launchSearch
                                          ? Container(
                                              height: 15,
                                              width: 15,
                                              child: CircularProgressIndicator(
                                                color: Colors.black,
                                              ))
                                          : Icon(Icons.refresh)),
                                ),
                              ))
                        ],
                      )
                    ]),
              ),
              KspaceHeight(context),
              Center(
                child: Container(
                  height: 7,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: Kheight(context, 0.01),
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(children: [
                  SizedBox(
                    height: Kheight(context, 0.03),
                  ),
                  Container(
                      height: Kheight(context, 0.06),
                      margin: EdgeInsets.symmetric(
                          horizontal: Kheight(context, 0.015)),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  dayId = 1;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.005),
                                    horizontal: KWigth(context, 0.025)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: dayId == 1
                                      ? Color(0xFF03adfe)
                                      : KprimaryColor,
                                ),
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Lundi",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  dayId = 2;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.005),
                                    horizontal: KWigth(context, 0.025)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: dayId == 2
                                      ? Color(0xFF03adfe)
                                      : KprimaryColor,
                                ),
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Mardi",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  dayId = 3;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.005),
                                    horizontal: KWigth(context, 0.025)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: dayId == 3
                                      ? Color(0xFF03adfe)
                                      : KprimaryColor,
                                ),
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Mercredi",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  dayId = 4;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.005),
                                    horizontal: KWigth(context, 0.025)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: dayId == 4
                                      ? Color(0xFF03adfe)
                                      : KprimaryColor,
                                ),
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Jeudi",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  dayId = 5;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.005),
                                    horizontal: KWigth(context, 0.025)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: dayId == 5
                                      ? Color(0xFF03adfe)
                                      : KprimaryColor,
                                ),
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Vendredi",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  dayId = 6;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.005),
                                    horizontal: KWigth(context, 0.025)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: dayId == 6
                                      ? Color(0xFF03adfe)
                                      : KprimaryColor,
                                ),
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Samedi",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  dayId = 7;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: Kheight(context, 0.005),
                                    horizontal: KWigth(context, 0.025)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: dayId == 7
                                      ? Color(0xFF03adfe)
                                      : KprimaryColor,
                                ),
                                child: TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Dimanche",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ))
                        ],
                      )),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Kheight(context, 0.015)),
                          height: Kheight(context, 0.4),
                          child: departuresList.length == 0
                              ? Center(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: Kheight(context, 0.1),
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: Kheight(context, 0.15),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/img/no-departure.png"))),
                                          ),
                                          Text(
                                            "Aucun départ prévu pour la " +
                                                week,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ]),
                                  ),
                                )
                              : CustomRefreshIndicator(
                                  /// delegate with configuration

                                  builder: MaterialIndicatorDelegate(
                                    builder: (context, controller) {
                                      return Icon(
                                        Icons.ac_unit,
                                        color: KsecondaryColor,
                                        size: 30,
                                      );
                                    },
                                  ),
                                  onRefresh: refreshDeparture,

                                  child: launchSearch
                                      ? SpinKitFadingCircle(
                                          color: KsecondaryColor,
                                        )
                                      : ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          itemCount: departuresList.length,
                                          itemBuilder: ((context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .scale,
                                                        duration: Duration(
                                                            milliseconds: 700),
                                                        reverseDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    700),
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: DepartureView(
                                                          departure:
                                                              departuresList[
                                                                  index],
                                                        )));
                                              },
                                              child: DepartureItem(
                                                departure:
                                                    departuresList[index],
                                              ),
                                            );
                                          })),
                                )))
                ]),
              )),
            ]),
          )),
    );
  }
}
