import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Relevant pages
import 'vibrate.dart';
import 'roll.dart';

class RollPage extends StatefulWidget {
  @override
  _RollPageState createState() => _RollPageState();
}

class _RollPageState extends State<RollPage> {
  int _totalNumDice = 0;
  int _totalRollValue = 0;
  int _listItemCount = 1;
  int _d4Count = 0;
  int _d6Count = 0;
  int _d10Count = 0;
  int _d12Count = 0;
  int _d20Count = 0;
  int _d100Count = 0;
  int _dnCount = 0;
  int _d2Count = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(_totalRollValue.toString(), style: TextStyle(fontSize: 50),),
      ),
      floatingActionButton: GestureDetector(
        onLongPress: () {
          setState(() {
            if (_listItemCount > 0) {
              HapticFeedback.vibrate();
              _listItemCount --;
            }
          });
        },
        child: FloatingActionButton(
          onPressed: (){
              _addListItem();
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _listItemCount,
              // Adds more list items dynamically by calling the build function.
              itemBuilder: (BuildContext context, int index) {
                return _buildDiceBody(index);
              }
            ),
          ),
        ],
      ),
    );
  }

  _buildDiceBody(int index) {
    return new Container(
      height: 80,
      padding: EdgeInsets.all(5),       
      margin: EdgeInsets.all(5),
      color: Colors.grey[900],
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget> [
          Container(
            margin: EdgeInsets.all(8),
            child: IconButton(
              icon: Icon(Icons.casino, size: 40.0, color: Colors.amber,),
              onPressed: () {
                _rollDice();
              }
            ),
          ),

         SizedBox(
           width: 100,
           child: TextField(
             decoration: InputDecoration(hintText: 'Name'),),),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.blue,
                  child: Text("d4", style: TextStyle(fontSize: 24, color: Colors.black),),
                  onPressed: () {
                    setState(() {
                      _d4Count ++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d4Count > 0) {
                        _d4Count --;
                      }
                    });
                  },
                ),
                _d4Count != 0 ? Positioned(
                  right: 11,
                  top: 11,
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
                    child: Text('$_d4Count', style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) : Container()
              ],
            ),
          ),

          Container(
            color: Colors.green,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.green,
                  child: Text("d6", style: TextStyle(fontSize: 24, color: Colors.black),),
                  onPressed: () {
                    setState(() {
                      _d6Count ++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d6Count > 0) {
                        _d6Count --;
                      }
                    });
                  },
                ),
                _d6Count != 0 ? Positioned(
                  right: 11,
                  top: 11,
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
                    child: Text('$_d6Count', style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) : Container()
              ],
            ),
          ),

          Container(
            color: Colors.orange,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.orange,
                  child: Text("d10", style: TextStyle(fontSize: 24, color: Colors.black),),
                  onPressed: () {
                    setState(() {
                      _d10Count ++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d10Count > 0) {
                        _d10Count --;
                      }
                    });
                  },
                ),
                // Note the ternary operator ('?') this is a shorthand 'if' statement that evalutes to
                // "if the dice count isn't 0 show a notification bubble with the dice count. If it is 0
                // show an empty container (aka show no notification).
                _d10Count != 0 ? Positioned(
                  right: 11,
                  top: 11,
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
                    child: Text('$_d10Count', style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) : Container() // Here is the condition not met value for the ternary operator. Note the colon,
                // the full syntax is <result = testCondition ? trueValue falseValue
              ],
            ),
          ),

          Container(
            color: Colors.yellow,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.yellow,
                  child: Text("d12", style: TextStyle(fontSize: 24, color: Colors.black),),
                  onPressed: () {
                    setState(() {
                      _d12Count ++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d12Count > 0) {
                        _d12Count --;
                      }
                    });
                  },
                ),
                _d12Count != 0 ? Positioned(
                  right: 11,
                  top: 11,
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
                    child: Text('$_d12Count', style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) : Container()
              ],
            ),
          ),

          Container(
            color: Colors.purple,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.purple,
                  child: Text("d20", style: TextStyle(fontSize: 24, color: Colors.black),),
                  onPressed: () {
                    setState(() {
                      _d20Count ++;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_d20Count > 0) {
                        _d20Count --;
                      }
                    });
                  },
                ),
                _d20Count != 0 ? Positioned(
                  right: 11,
                  top: 11,
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
                    child: Text('$_d20Count', style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) : Container()
              ],
            ),
          ),

          IconButton(
            icon: Icon(Icons.more_vert, size: 40 , color: Colors.amber),
            color: Colors.amber,
            onPressed: null,
          ),
        ],
      ),
    );
  }

  _addListItem() {
    setState(() {
      _listItemCount ++;
    });
  }

  // This is called when u press the golden die on the left of each dice row, it returns the int total pip value.
  _rollDice() {
    setState(() {
    _totalRollValue = 0;
    _totalNumDice = _d2Count + _d4Count + _d6Count + _d10Count + _d12Count + _d20Count + _d100Count + _dnCount;
    // TODO try keeping track of _dNUMBER count variables here to fix bug (renitizalize when function is called).

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
    _totalRollValue += Roll().rollMultipleInRange(1, 101, _d100Count, 0);

    // TODO create a local variable to hold the dn face value and then pass this to the Roll class as a param.
    // Return dn total
    // for (int i = 0; i < _dnCount; i ++) {
    //   _totalRollValue += Roll().rollInRange(1, 5);
    // }

      // Trigger vibration 'dice roll' feedback based on how many dice are being rolled.
      if(_totalNumDice > 0 && _totalNumDice < 5) { Vibrate().smallRoll();}
      if(_totalNumDice >= 5 && _totalNumDice < 10) { Vibrate().bigRoll();}
      if(_totalNumDice >= 10) { Vibrate().epicRoll();}
  
    return _totalRollValue;
    });
  }

}