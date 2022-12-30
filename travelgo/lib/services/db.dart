import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:travelgo/models/departureModel.dart';
import 'package:travelgo/models/userModel.dart';

class DBservice {
  //les différentes collections de référence

  CollectionReference usersCollections =
      FirebaseFirestore.instance.collection("employes");
//Tous les départ
  final Query departuresListQuery = FirebaseFirestore.instance
      .collection('departures')
      .orderBy('weekId', descending: true);

//methode pour enregistrer un nouvel utilisateur

  Future<void> saveUserData(String email, String matricule, String name,
      String password, String phone, String surname, User user) async {
    return await usersCollections.doc(user.uid).set({
      "id": user.uid,
      "email": email,
      "matricule": matricule,
      "name": name,
      "password": password,
      "phone": phone,
      "surname": surname,
    });
  }

  //methodes pour recupérer les données de l'utilisateur connecté

  UserData _userSnapshotDataFetching(DocumentSnapshot snapshot) {
    return UserData(
      id: snapshot['id'],
      email: snapshot['email'],
      matricule: snapshot['matricule'],
      name: snapshot['name'],
      password: snapshot['password'],
      phone: snapshot['phone'],
      surname: snapshot['surname'],
    );
  }

  Stream<List<Departure>> get departuresList {
    return departuresListQuery.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Departure(
            idDeparture: doc.get("idDeparture"),
            vehicleName: doc.get('vehicleName'),
            vehicleType: doc.get('vehicleType'),
            weekId: doc.get('weekId'),
            availablePlaces: doc.get('availablePlaces'),
            departure_date: doc.get('departure_date'),
            departure_hour: doc.get('departure_hour'),
            departure_min: doc.get('departure_min'),
            destination: doc.get('destination'),
            placeOfDeparture: doc.get('placeOfDeparture'),
            totalPlaces: doc.get('totalPlaces'),
            passengersList: doc.get('passengersList'));
      }).toList();
    });
  }
}
