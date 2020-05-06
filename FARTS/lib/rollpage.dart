import 'package:FARTS/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Relevant pages
import 'services/vibrate.dart';
import 'services/roll.dart';

int totalRollValue = 0;

class RollPage extends StatefulWidget {
  @override
  _RollPageState createState() => _RollPageState();
}

class _RollPageState extends State<RollPage> {
  int _listItemCount = 1;

  // @override
  // Widget build(BuildContext context) {
  //   return CustomScaffold(body: _diceBagBody(context));
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      // Wrapping the FAB in gesture detector allows it to listen to long taps as well as taps.
      floatingActionButton: GestureDetector(
        key: Key('Vibrate'),
        onLongPress: () {
          setState(() {
            if (_listItemCount > 0) {
              HapticFeedback.vibrate();
              _listItemCount--;
            }
          });
        },
        child: FloatingActionButton(
          key: Key('ListCount'),
          onPressed: () {
            setState(() {
              _listItemCount++;
            });
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              child: Text(
                totalRollValue.toString(),
                style: TextStyle(fontSize: 95, color: Colors.red),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _listItemCount,
                // Adds more list items dynamically by calling the build function.
                itemBuilder: (BuildContext context, int index) {
                  // Creates a new instance of the DiceBag() class every time _listItemCount is incremented.
                  // Provides _updateRollTotal as a callback function so the DiceBag() child can update the
                  // the total roll displayed in the parent.
                  return DiceBag(parentAction: _updateRollTotal);
                }),
          ),
        ],
      ),
    );
  }

  // This function is passed as a callback to the DiceBag() child.
  _updateRollTotal(int totalFromChild) {
    setState(() {
      totalRollValue = totalFromChild;
    });
  }
}

// Companion Class enables each row of dice widgets to be instantiated on demand and keep track of their own dice values.
class DiceBag extends StatefulWidget {
  final ValueChanged<int> parentAction;
  final String title;
  const DiceBag({Key key, this.title, this.parentAction}) : super(key: key);

  @override
  _DiceBagState createState() => _DiceBagState();
}

class _DiceBagState extends State<DiceBag> {
  int _totalNumDice = 0;
  int _totalRollValue = 0;
  int _d4Count = 0;
  int _d6Count = 0;
  int _d10Count = 0;
  int _d12Count = 0;
  int _d20Count = 0;
  int d100Count = 0;
  int _dnCount = 0;
  int _d2Count = 0;

  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      color: Colors.grey[900],
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            child: IconButton(
                key: Key('RollDiceIcon'),
                icon: Icon(
                  Icons.casino,
                  size: 40.0,
                  color: Colors.amber,
                ),
                onPressed: () {
                  _rollDice();
                }),
          ),
          SizedBox(
            width: 110,
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(hintText: 'Name'),
            ),
          ),
          Container(
            key: Key('d4'),
            color: Colors.blue,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.blue,
                  child: Text(
                    "d4",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      _d4Count++;
                      _totalNumDice++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d4Count > 0) {
                        _d4Count--;
                        _totalNumDice--;
                      }
                    });
                  },
                ),
                _d4Count != 0
                    ? Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$_d4Count',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            color: Colors.green,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  key: Key('d6'),
                  splashColor: Colors.green,
                  child: Text(
                    "d6",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      _d6Count++;
                      _totalNumDice++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d6Count > 0) {
                        _d6Count--;
                        _totalNumDice--;
                      }
                    });
                  },
                ),
                _d6Count != 0
                    ? Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$_d6Count',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  key: Key('d10'),
                  splashColor: Colors.yellow,
                  child: Text(
                    "d10",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      _d10Count++;
                      _totalNumDice++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d10Count > 0) {
                        _d10Count--;
                        _totalNumDice--;
                      }
                    });
                  },
                ),
                // Note the ternary operator ('?') this is a shorthand 'if' statement that evalutes to
                // "if the dice count isn't 0 show a notification bubble with the dice count. If it is 0
                // show an empty container (aka show no notification).
                _d10Count != 0
                    ? Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$_d10Count',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container() // Here is the condition not met value for the ternary operator. Note the colon,
                // the full syntax is <result = testCondition ? trueValue falseValue
              ],
            ),
          ),
          Container(
            color: Colors.orange,
            margin: EdgeInsets.all(8),
            child: Stack(
              key: Key('d12'),
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.orange,
                  child: Text(
                    "d12",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      _d12Count++;
                      _totalNumDice++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d12Count > 0) {
                        _d12Count--;
                        _totalNumDice--;
                      }
                    });
                  },
                ),
                _d12Count != 0
                    ? Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$_d12Count',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            key: Key('d20'),
            color: Colors.purple,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.purple,
                  child: Text(
                    "d20",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      _d20Count++;
                      _totalNumDice++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d20Count > 0) {
                        _d20Count--;
                        _totalNumDice--;
                      }
                    });
                  },
                ),
                _d20Count != 0
                    ? Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$_d20Count',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            color: Colors.red[800],
            margin: EdgeInsets.all(8),
            child: Stack(
              key: Key('d100'),
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.purple,
                  child: Text(
                    "d100",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      d100Count++;
                      _totalNumDice++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (d100Count > 0) {
                        d100Count--;
                        _totalNumDice--;
                      }
                    });
                  },
                ),
                d100Count != 0
                    ? Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$d100Count',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert, size: 40, color: Colors.amber),
            color: Colors.amber,
            onPressed: null,
          ),
        ],
      ),
    );
  }

  // This is called when u press the golden die on the left of each dice row, it returns the int total pip value.
  _rollDice() {
    setState(() {
      _totalRollValue = 0;
      // Capture d2 total
      _totalRollValue += Roll().rollMultipleInRange(1, 3, _d2Count, 0);
      // Capture d4 total
      _totalRollValue += Roll().rollMultipleInRange(1, 5, _d4Count, 0);
      // Capture d6 total
      _totalRollValue += Roll().rollMultipleInRange(1, 7, _d6Count, 0);
      // Capture d10 total
      _totalRollValue += Roll().rollMultipleInRange(1, 11, _d10Count, 0);
      // Capture d12 total
      _totalRollValue += Roll().rollMultipleInRange(1, 13, _d12Count, 0);
      // Capture d20 total
      _totalRollValue += Roll().rollMultipleInRange(1, 21, _d20Count, 0);
      // Capture d100 total
      _totalRollValue += Roll().rollMultipleInRange(1, 101, d100Count, 0);

      // TODO create a local variable to hold the dn face value and then pass this to the rollMultipeInRange() as a param.

      // Trigger vibration 'dice roll' feedback based on how many dice are being rolled.
      if (_totalNumDice > 0 && _totalNumDice < 5) {
        Vibrate().smallRoll();
      }
      if (_totalNumDice >= 5 && _totalNumDice < 10) {
        Vibrate().bigRoll();
      }
      if (_totalNumDice >= 10) {
        Vibrate().epicRoll();
      }

      // Send _totalRollValue back to parent via provided callback function.
      widget.parentAction(_totalRollValue);
    });
  }
}
