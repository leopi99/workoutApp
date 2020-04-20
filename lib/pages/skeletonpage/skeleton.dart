import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/pages/homepage/home.dart';
import 'package:workout/pages/all_exercise_page/all_exercise.dart';
import 'package:workout/pages/widgets/navbar.dart';
import 'package:workout/states/nav_state.dart';

List<Widget> _pages = [
  Homepage(),
  Center(
    child: Text('Pagina sugli attrezzi'),
  ),
  AllExercises(),
  Center(
    child: Text('Pagina dell\'account'),
  ),
];

class SkeletonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 8),
        child: Consumer<NavState>(
          builder: (context, state, _) => Center(
            child: _pages[state.index],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
