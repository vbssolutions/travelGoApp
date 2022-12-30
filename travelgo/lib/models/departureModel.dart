class Departure {
  int? idDeparture;
  String? vehicleType;
  String? vehicleName;
  int? weekId;
  int? departure_hour;
  int? departure_min;
  List<int>? departure_date;
  String? destination;
  String? placeOfDeparture;
  int? totalPlaces;
  int? availablePlaces;
  List<String>? passengersList;

  Departure(
      {this.idDeparture,
      this.vehicleName,
      this.vehicleType,
      this.weekId,
      this.availablePlaces,
      this.departure_date,
      this.departure_hour,
      this.departure_min,
      this.destination,
      this.placeOfDeparture,
      this.totalPlaces,
      this.passengersList});
}
