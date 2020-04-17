import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:workout/states/exercise_state.dart';

//  Page with all the exercises to do today

enum Days { LUN, MAR, MER, GIO, VEN, SAB, DOM }

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseState>(
      builder: (context, state, _) => state
                  .exerciseFor(DateTime.now().weekday)
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
          : ListView(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(8.0).copyWith(top: 12, bottom: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 32),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Sessione',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      '5 mancanti',
                                      style: TextStyle(
                                        color: Colors.grey[350],
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 128,
                                padding: EdgeInsets.only(top: 8),
                                child: Material(
                                  borderRadius: BorderRadius.circular(4),
                                  clipBehavior: Clip.antiAlias,
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.grey[350],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.green),
                                    value: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 56,
                          height: 56,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    7,
                    (index) => Material(
                      borderRadius: BorderRadius.circular(4),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            Days.values[index].toString().substring(5),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                                'Oggi ${DateTime.now().day}/${DateTime.now().month}'),
                          ],
                        ),
                        Row(),
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => _ExerciseWidget(index),
                  itemCount: state.exerciseFor(DateTime.now().weekday).length,
                ),
              ],
            ),
    );
  }
}

class _ExerciseWidget extends StatelessWidget {
  final int _exerciseIndex;
  _ExerciseWidget(this._exerciseIndex);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: Row(),
    );
  }
}
