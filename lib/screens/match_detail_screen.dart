import 'package:flutter/material.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Partido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Oponente: ${args['opponent']}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Fecha: ${args['date']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Resultado: ${args['result']}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
