import 'package:flutter/material.dart';
import 'package:travelgo/models/departureModel.dart';
import 'package:travelgo/models/notificationModel.dart';

import 'package:travelgo/models/userModel.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> weekList = [
  "Semaine-1",
  "Semaine-2",
  "Semaine-3",
  "Semaine-4",
];
List<String> destinationsList = [
  "Non défini",
  "Banfora",
  "Kaya, Essakane",
  "Bobo Dioulasso",
  "Abidjan",
  "Djibo"
];

List<String> departureOfLocationList = [
  "Non défini",
  "Roxgold",
  "Kaarma",
  "Endevour Mining"
];

List<NotificationModel> notificationsList = [
  NotificationModel(
      notificationBody: RichText(
          text: TextSpan(
              text: "Rappel: Votre départ pour Djibo est prévu dans ",
              children: [
                TextSpan(
                    text: "30 min",
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange))
              ],
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF434a61)))),
      notificationType: "rappel",
      date: "12h55"),
  NotificationModel(
      notificationBody: RichText(
          text: TextSpan(
              text:
                  "Réservation: vous avez réservé un ticket pour Kaya prévu pour ",
              children: [
                TextSpan(
                    text: "aujourd'hui à 14h",
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green))
              ],
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF434a61)))),
      notificationType: "réservation",
      date: "10h33"),
  NotificationModel(
      notificationBody: RichText(
          text: TextSpan(
              text: "Infos: tous les départ pour djibo sont  ",
              children: [
                TextSpan(
                    text: "annulés ",
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
                TextSpan(text: "pour des raisons de mésures sécuritaires.")
              ],
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF434a61)))),
      notificationType: "infos",
      date: "14h46"),
];
