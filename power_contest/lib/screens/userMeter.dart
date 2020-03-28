import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:power_contest/screens/leaderboard.dart';

class UserMeter extends StatefulWidget {
  final String email;
  UserMeter({Key key, this.email}) : super(key: key);

  @override
  _UserMeterState createState() => _UserMeterState();
}

class _UserMeterState extends State<UserMeter> {
  String name;
  int meterID;

  //text controller
  final TextEditingController controller = new TextEditingController();

Widget _email() {
  if(widget.email != null && widget.email.length != 0) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Email: ',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: widget.email,
              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ]),
    );
  } else {
    return SizedBox();
  }
}

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
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

  Widget _entryField(String title, {bool isCode = false}) {
    return Container(
      margin: isCode == true ? EdgeInsets.symmetric(vertical: 10, horizontal: 90): EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: isCode == true ? CrossAxisAlignment.center: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            onChanged: (dynamic string) {
              if(isCode) {
                meterID = string;
              } else {
                name = string;
              }
            },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(0, 126, 222, 0.1),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Leaderboard()));
      },
          child: Container(
        width: MediaQuery.of(context).size.width/3,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            color: Color.fromRGBO(0, 187, 255, 1),
            ),
        child: Text(
          'Continue',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Power',
          style: GoogleFonts.portLligatSans(
            fontSize: 35,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'Contest',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
          ]),
    );
  }

  Widget _tempinfo() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Meter ID", isCode: true),
      ],
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
                padding: EdgeInsets.only(left: 35, right: 35, bottom: 20),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      _title()
                    ]),
                    SizedBox(height: 25,),
                    Text(
                      "Provide a temporary User Name and Meter ID.",
                      style: TextStyle(color: Colors.white),),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _top(),
                        SizedBox(
                          height: 40,
                        ),
                        _email(),
                        _tempinfo(),
                        SizedBox(
                          height: 20,
                        ),
                        _submitButton(),
                      ],
                    ),
                  ),
                  
                  Positioned(top: 40, left: 0, child: _backButton()),
                 
                ],
              ),
            ),
      )
        
    );
  }
}