import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:premiun_deluxe_motorsport/models/vehicles.dart';

class GtaApi {
  static Future<Vehicles> getVehicles() async {
    String name = "kuruma";
    var url = Uri.parse('https://gta.now.sh/api/vehicles/$name');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return Vehicles.fromJson(response.body);
    } else {
      throw Exception("ERRO de requisição");
    }
  }
}