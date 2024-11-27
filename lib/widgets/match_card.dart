import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final String opponent;
  final String date;
  final String result;

  const MatchCard({super.key, required this.opponent, required this.date, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(opponent, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('Fecha: $date'),
        trailing: Text(result.isNotEmpty ? result : 'Por jugar', 
          style: TextStyle(
            color: result.isNotEmpty ? Colors.green : Colors.orange,
            fontWeight: FontWeight.bold,
          )),
        onTap: () {
          Navigator.pushNamed(context, '/match-detail', arguments: {
            'opponent': opponent,
            'date': date,
            'result': result,
          });
        },
      ),
    );
  }
}
