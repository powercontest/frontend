import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:power_contest/functions/functions.dart';
import 'package:power_contest/models/community.dart';
import 'package:power_contest/models/jsonMeter.dart';
import 'package:power_contest/models/meter.dart';
import 'package:power_contest/screens/detailPage.dart';
import 'package:power_contest/screens/welcomepage.dart';

class Leaderboard extends StatefulWidget {
  final String username;
  final int meterId;
  Leaderboard({Key key, this.username, this.meterId}) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  bool _loading = true;
  List<JsonMeter> harrington;
  @override
  void initState() {
    super.initState();
    getRequest().then((value) {
      print(value);
      harrington = value;
      setState(() {
        _loading = false;
      }); 
    });
  }

  Widget loadingCircle() {
    return Expanded(
          child: Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(value: null, strokeWidth: 6, semanticsLabel: "Loading...",),
          SizedBox(height: 10,),
          Text("Loading Data...", style: TextStyle(fontWeight: FontWeight.w400),)
        ],
      ),),
    );
  }

  Widget _name() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Welcome, ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: widget.username + ".",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ]),
        ),
      ],
    );
  }

  Widget _menuButton() {
    return Padding(
      padding: EdgeInsets.only(top: 18.0),
      child: Row(children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.signOutAlt, size: 35, color: Colors.white,),
                  onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage())),)
        ],),
    );
  }

  Widget _top() {
    return Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45), bottomRight: Radius.circular(0)),
                  color: Colors.blue,
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _menuButton(),
                    SizedBox(height: 10,),
                    Column(children: <Widget>[
                      _name(),
                      SizedBox(height: 35,),
                      Column(
                        children: <Widget>[
                          Text(
                            "CURRENT",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "RANKINGS",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ],),

                  ],
                ),
              ),
              
            ],
          );
  }

Widget horText(String title, String value) {
  return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: title + " ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: value,
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ]),
              );
}

String kwhToCoal(double kwh) {
  double lbsCoal = (kwh / 2460) * 2000;
  return lbsCoal.floor().toString();
}

Widget _readingTile(BuildContext context, int index, JsonMeter meter) {
  index++;
  
  String city;
  String state = meter.state;
  meter.city == null ? city = "Herndon" : city = meter.city;
  meter.state == null ? state = "VA" : state = meter.state;

  return Container(
    decoration: 
        BoxDecoration(
          color: widget.meterId.toString() == meter.id ? Color.fromRGBO(250, 250, 250, 0.9): Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: widget.meterId.toString() == meter.id ? Colors.blue : Colors.black26, offset: Offset(0, 2), blurRadius: 6)]
              ),
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width,
    child: Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Text("#$index", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.blue),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            horText("Usage:", meter.reading.toString() + " kWh"),
            horText("Meter ID:", meter.id.toString())
          ],)
      ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black26), borderRadius: BorderRadius.circular(10),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Icon(FontAwesomeIcons.tree, color: Colors.blue,), 
                Text(kwhToCoal(meter.reading) + " lbs of Coal")
              ],),
              SizedBox(height: 10,),
              Row(children: <Widget>[
                Icon(FontAwesomeIcons.mapPin, color: Colors.blue,), 
                Text("$city, $state")
              ],),
            ],
          )
        ),
        Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
          color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)]
              ),
          child: GestureDetector(
            onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(meter: meter, rank: index,))),
                      child: Row(children: <Widget>[
              Text("More Details ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),),
              Icon(FontAwesomeIcons.chevronRight, color: Colors.white, size: 15,)
            ],),
          ),
        )
      ],)
    ],),
  );
}

Widget _listMeters() {
  if (_loading) {
    return loadingCircle();
  } else {
      return Expanded(
        child: ListView.builder(
          itemCount: harrington.length,
          itemBuilder: (BuildContext context, int index) {
            JsonMeter meter = harrington[index];
            return _readingTile(context, index, meter);
          }));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          _top(),
          _listMeters()
        ],
      ),
    );
  }
}