import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travelgo/views/constants.dart';
import 'package:travelgo/views/notificationsview/notificationsview.dart';
import 'package:travelgo/views/ticketListview/ticketListview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProgressBar extends StatefulWidget {
  final double max;
  final double current;
  ProgressBar({
    Key? key,
    required this.max,
    required this.current,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  bool isLoading = false;
  bool ticketIsSave = false;

  void saveTicket(BuildContext context) async {
    setState(() {
      ticketIsSave = true;
    });
    Navigator.pop(context);

    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.scale,
            duration: Duration(milliseconds: 700),
            reverseDuration: Duration(milliseconds: 700),
            alignment: Alignment.bottomCenter,
            child: MyTicketsview()));
  }

  void loadingTimer(BuildContext context) async {
    Timer(Duration(seconds: 2), () {
      saveTicket(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        var percent = widget.max;
        return Center(
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  loadingTimer(context);
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
                      "ENREGISTRER POUR LE CONTRÔLE",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                margin: EdgeInsets.symmetric(
                    vertical: Kheight(context, 0.005),
                    horizontal: KWigth(context, 0.025)),
                duration: Duration(seconds: 2),
                width: isLoading ? percent : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: KprimaryColor.withOpacity(0.9),
                ),
                child: TextButton(
                  onPressed: null,
                  child: Text(
                    "",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
