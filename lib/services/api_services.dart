import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_model.dart';

class ApiServices {
  final String baseUrl = "https://randomfox.ca/floof/";

  Future<Fox> fetchFox() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Fox.fromJson(data);
    } else {
      throw Exception('Error al cargar la imagen del zorro');
    }
  }
}