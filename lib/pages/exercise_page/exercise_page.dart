import 'package:flutter/material.dart';
import 'package:workout/models/exercise.dart';
import 'package:workout/models/palette.dart';

const int NAME_LENGTH = 25;

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
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 64.0,
                  width: 64.0,
                  child: RaisedButton(
                    color: Colors.black87,
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    '${exercise.name.length > NAME_LENGTH ? exercise.name.substring(0, NAME_LENGTH) + "..." : exercise.name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ],
            ),
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
