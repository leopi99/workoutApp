import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout/models/palette.dart';
import 'package:workout/pages/skeletonpage/skeleton.dart';
import 'package:provider/provider.dart';
import 'package:workout/states/exercise_state.dart';
import 'package:workout/states/nav_state.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NavState(),
          ),
          ChangeNotifierProvider(
            create: (context) => ExerciseState(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout',
      theme: ThemeData(
        scaffoldBackgroundColor: Palette().scaffoldBackgroundColor,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SkeletonPage(),
    );
  }
}
