import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://apiclient.besoccerapps.com/scripts/api/api.php';
  final String apiKey = '<ca416531c72c8348927aab6a5a1f2cab>'; // Reemplaza con tu API Key de BeSoccer.
  final String season = '2024'; // Ajusta el año de la temporada según sea necesario.
  final String teamId = '173'; // ID de la selección uruguaya según BeSoccer.

  Future<List<dynamic>> fetchMatches() async {
    try {
      final response = await http.get(Uri.parse(
          '$apiUrl?key=$apiKey&format=json&req=team_matches&team=$teamId&season=$season'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['error'] == false) {
          return data['matches']; // Lista de partidos.
        } else {
          throw Exception('Error en la API: ${data['message']}');
        }
      } else {
        throw Exception('Error en la conexión: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al consumir la API: $e');
    }
  }
}
