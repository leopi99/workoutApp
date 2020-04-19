import 'package:flutter/material.dart';
import 'package:workout/models/exercise.dart';
import 'package:workout/models/palette.dart';

class ExercisePage extends StatelessWidget {
  final Exercise exercise;
  ExercisePage({@required this.exercise});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette().scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16)
            .copyWith(top: 32),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                tooltip: 'Torna indietro',
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.grey[600],
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  '${exercise.name.length > 30 ? exercise.name.substring(0, 30) + "..." : exercise.name}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ],
          ),
          Text(
            'Esecuzione:',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Text(
            exercise.description,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
