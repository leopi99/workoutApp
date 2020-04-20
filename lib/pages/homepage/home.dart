import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:workout/states/exercise_state.dart';
import 'package:workout/states/nav_state.dart';

import 'package:workout/pages/homepage/exercise_widget.dart';
//  Page with all the exercises to do today

enum Days { LUN, MAR, MER, GIO, VEN, SAB, DOM }
enum Months {
  gennaio,
  febbraio,
  marzo,
  aprile,
  maggio,
  giugno,
  luglio,
  agosto,
  settembre,
  ottobre,
  novembre,
  dicembre
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16).copyWith(bottom: 24),
          child: Center(
            child: Text(
              'Programma giornaliero',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
        // Widget sessione
        Material(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Sessione',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            '${Provider.of<ExerciseState>(context).exerciseFor(Provider.of<NavState>(context).dayIndex).length - Provider.of<ExerciseState>(context).exerciseFor(Provider.of<NavState>(context).dayIndex).where((element) => element.done ?? false).length} mancante',
                            style: TextStyle(
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Material(
                        borderRadius: BorderRadius.circular(4),
                        clipBehavior: Clip.antiAlias,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[350],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                          value: 0.75,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.only(left: 32),
                  child: RaisedButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                    elevation: 0,
                    color: Colors.black,
                    textColor: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Widget per la selezione del giorno
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              7,
              (index) => Material(
                borderRadius: BorderRadius.circular(4),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => Provider.of<NavState>(context, listen: false)
                      .changeDay(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      Days.values[index].toString().substring(5),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Provider.of<NavState>(context).dayIndex == index
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (Provider.of<NavState>(context).dayIndex ==
            DateTime.now().weekday - 1)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Oggi, ${DateTime.now().day} ${Months.values[DateTime.now().month].toString().substring(
                        7,
                      )}',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
          ),
        Provider.of<ExerciseState>(context)
                    .exerciseFor(Provider.of<NavState>(context).dayIndex)
                    .length ==
                0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'images/svgs/yoga.svg',
                    height: 156.0,
                    width: 312.0,
                  ),
                  SizedBox(height: 16.0),
                  Text('Non hai ancora inserito nessun esercizio'),
                ],
              )
            : ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                itemBuilder: (context, index) => ExerciseWidget(
                  Provider.of<ExerciseState>(context).exerciseFor(
                      Provider.of<NavState>(context).dayIndex)[index],
                ),
                itemCount: Provider.of<ExerciseState>(context)
                    .exerciseFor(Provider.of<NavState>(context).dayIndex)
                    .length,
              ),
      ],
    );
  }
}
