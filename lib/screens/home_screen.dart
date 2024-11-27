import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/match_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _matches = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMatches();
  }

  Future<void> _loadMatches() async {
    try {
      List<dynamic> matchesFromApi = await _apiService.fetchMatches();
      setState(() {
        _matches = matchesFromApi;
        _isLoading = false;
      });
    } catch (e) {
      print('Error al cargar los partidos: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultados Uruguay')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _matches.isEmpty
              ? const Center(child: Text('No hay partidos disponibles'))
              : ListView.builder(
                  itemCount: _matches.length,
                  itemBuilder: (context, index) {
                    final match = _matches[index];
                    return MatchCard(
                      opponent: match['rival']['name'], // Nombre del rival.
                      date: match['date'], // Fecha del partido.
                      result: match['result'], // Resultado del partido.
                    );
                  },
                ),
    );
  }
}
