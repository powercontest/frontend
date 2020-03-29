import 'package:flutter/material.dart';
import 'package:power_contest/models/meter.dart';

class DetailPage extends StatefulWidget {
  final Meter meter;
  final int rank;
  DetailPage({Key key, this.meter, this.rank}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
    String commName;
    widget.meter.community == null ? commName = "Harrington" : commName = widget.meter.community;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(children: <Widget>[
                          SizedBox(height: 25,),
                          Text(
                            "#" + widget.rank.toString(),
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "in the ${commName} Community.",
                            style: TextStyle(
                              
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                              overflow: TextOverflow.clip,
                          ),
                        ],)
                      
                    ]),
                  ],
                ),
              ),
              
            ],
          );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        _top(),
        
      ],),
    );
  }
}