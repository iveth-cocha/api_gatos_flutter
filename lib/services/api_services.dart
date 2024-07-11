import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class ApiServices{
  final String baseUrl= "https://pokeapi.co/api/v2";

  Future<List<Pokemon>>fetchPokemosnList() async {
    final response =await http.get(Uri.parse('$baseUrl/pokemon?limit=5'));
    
    if (response.statusCode==200){
      final data = json.decode(response.body);
      final List results= data['results'];
      return results.map((e) => Pokemon.fromJson(e)).toList();
    }else{
      throw Exception('errores para cragar ppokemon');
    }
  }
}