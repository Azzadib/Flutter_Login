import 'dart:convert';

class Vehicle {
  String name;
  String type;
  String equipment;
  String urlToImage;

  Vehicle({
    this.name,
    this.type,
    this.equipment,
    this.urlToImage
  });

  Vehicle.fromJson(Map<String, dynamic> vehicle) {
    name = vehicle['name'];
    type = vehicle['type'];
    equipment = vehicle['equipment'];
    urlToImage = vehicle['urlToImage'];
  }
}

List<Vehicle> parseVehicles(String json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => Vehicle.fromJson(json)).toList();
}