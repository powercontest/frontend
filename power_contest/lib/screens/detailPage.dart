import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:power_contest/models/jsonMeter.dart';
import 'package:power_contest/models/meter.dart';
import 'dart:math';

import 'package:power_contest/screens/signupPage.dart';

class DetailPage extends StatefulWidget {
  final JsonMeter meter;
  final int rank;
  DetailPage({Key key, this.meter, this.rank}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String defCity = "Herndon";
  String defState = "VA";
  var random = new Random();

   Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 35),
            ),
            Text('Back',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white))
          ],
        ),
      ),
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
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _backButton(),
                    SizedBox(height: 20,),
                   Center(
                     child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Details for Meter ID ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "#${widget.meter.id}",
                                style: TextStyle(color: Colors.black, fontSize: 25),
                              ),
                            ]),
                      ),
                   ),
                   SizedBox(height: 20,),
                  ],
                ),
              ),
              
            ],
          );
  }

  Decoration containerDecor() {
    return BoxDecoration(
          color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)]
              );
  }

  Widget horText(String title, String value) {
  return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: title + " ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: value,
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ]),
              );
  }

  String kwhToCoal(double kwh) {
    double lbsCoal = (kwh / 2460) * 2000;
    return lbsCoal.floor().toString();
  }

  String kwhToGallon(double kwh) {
    double gallons = (kwh / 36);
    return gallons.floor().toString();
  }

  Widget secondRow() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: containerDecor(),
              child: Column(children: <Widget>[
                Icon(FontAwesomeIcons.tree, size: 50, color: Colors.blue,),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${kwhToCoal(widget.meter.reading)} lbs"),
                    SizedBox(height: 5,),
                    Text("COAL", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                  ],
                )
              ],),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: containerDecor(),
              child: Column(children: <Widget>[
                Icon(FontAwesomeIcons.oilCan, size: 50, color: Colors.blue,),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${kwhToGallon(widget.meter.reading)} Gallons"),
                    SizedBox(height: 5,),
                    Text("GAS", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                  ],
                )
              ],),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: containerDecor(),
              child: Column(children: <Widget>[
                Icon(FontAwesomeIcons.searchLocation, size: 50, color: Colors.blue,),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${widget.meter.city == null ? defCity : widget.meter.city}"),
                    SizedBox(height: 5,),
                    Text("${widget.meter.state == null ? defState : widget.meter.state}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                  ],
                )
              ],),
            )
          ],
        );
  }

  Widget claimed() {
    if (widget.meter.owner == null) {
      return GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignupPage())),
              child: Center(
          child: Container(
            decoration: BoxDecoration(
            color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)]
                ),
            padding: EdgeInsets.all(14),
            child: Text("CLAIM NOW", style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            )),),
              ),
      );
    } else {
      return Center(child: 
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Claimed By: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: widget.meter.owner,
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ]),
          ));
    }
  }

  Widget details() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: containerDecor(),
            child: Column(
              children: <Widget>[
                Text("#${widget.rank}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.blue),),
                Text("Community Rank")
              ],
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            horText("Usage:", widget.meter.reading.toString() + " kWh"),
            SizedBox(height: 15,),
            horText("Meter ID:", widget.meter.id.toString())
          ],)
        ],),
        SizedBox(height: 15,),
        //second row
        secondRow(),
        SizedBox(height: 15,),
        //third row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           Container(
            padding: EdgeInsets.all(10),
            decoration: containerDecor(),
            child: Column(
              children: <Widget>[
                Text("#${random.nextInt(100)}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.blue),),
                Text("City Rank")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: containerDecor(),
            child: Column(
              children: <Widget>[
                Text("#${random.nextInt(300)}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.blue),),
                Text("State Rank")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: containerDecor(),
            child: Column(
              children: <Widget>[
                Text("#${random.nextInt(100)}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.blue),),
                Text("City Rank")
              ],
            ),
          ),
        ],),
        SizedBox(height: 20,),
        claimed()
      ],)
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        _top(),
        SizedBox(height: 20,),
        details()
      ],),
    );
  }
}