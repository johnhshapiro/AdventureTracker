import 'package:flutter/material.dart';

// Relevant pages
import 'vibrate.dart';

class Roll extends StatefulWidget {
  @override
  _RollState createState() => _RollState();
}

class _RollState extends State<Roll> {
  int _listItemCount = 1;
  int _d2Count = 0;
  int _d4Count = 0;
  int _d6Count = 0;
  int _d10Count = 0;
  int _d12Count = 0;
  int _d20Count = 0;
  int _d100Count = 0;
  int _dnCount = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _addListItem();
          });
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: this._listItemCount,
              // Adds more list items dynamically by calling the build function.  
              //itemBuilder: (context, index) => this._buildListTile(index)),
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
    return Container(
      height: 80,
      padding: EdgeInsets.all(5),       
      margin: EdgeInsets.all(5),
      color: Colors.grey[900],
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget> [
          IconButton(
            icon: Icon(Icons.casino, size: 40.0, color: Colors.amber,),
            onPressed: () {
              Vibrate().bigRoll();
            }
         ),

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
            color: Colors.red,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                MaterialButton(
                  splashColor: Colors.red,
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
                ) : Container()
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

}