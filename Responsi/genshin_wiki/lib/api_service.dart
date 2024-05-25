import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detail_char_model.dart';
import 'detail_weapon_model.dart';

class ApiService {
  final String baseUrl = 'https://genshin.jmp.blue';

  Future<List<dynamic>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<DetailCharModel> fetchCharacterDetail(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/characters/$name'));
    if (response.statusCode == 200) {
      return DetailCharModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load character details');
    }
  }

  Future<List<dynamic>> fetchWeapons() async {
    final response = await http.get(Uri.parse('$baseUrl/weapons'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weapons');
    }
  }

  Future<DetailWeaponModel> fetchWeaponDetail(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/weapons/$name'));
    if (response.statusCode == 200) {
      return DetailWeaponModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weapon details');
    }
  }
}