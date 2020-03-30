import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:power_contest/functions/functions.dart';
import 'package:power_contest/screens/leaderboard.dart';
import 'package:power_contest/screens/userMeter.dart';
import 'signupPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_contest/screens/signupPage.dart';


class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email, password;
  String username;
  int meterID;

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
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 35,),
            ),
            Text('Back',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _emailPass(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          SizedBox(
            height: 10,
          ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: title,
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(0, 126, 222, 0.1),
                  filled: true),
              keyboardType: isPassword == true ? TextInputType.visiblePassword:TextInputType.emailAddress,
              maxLines: 1,
              validator: (value) => value.isEmpty ? "Field can't be empty" : null,
                  onChanged: (value) => isPassword == true ? password = value : email=value,

            )
        ],
      ),
    );
  }

  Widget _userMeterField(String title, {bool isCode = false}) {
    return Container(
      margin: isCode == true ? EdgeInsets.symmetric(vertical: 10, horizontal: 90): EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: isCode == true ? CrossAxisAlignment.center: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: title,
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(0, 126, 222, 0.1),
                  filled: true),
              keyboardType: isCode == true ? TextInputType.number:TextInputType.text,
              maxLines: 1,
              validator: (value) => value.isEmpty ? "Field can't be empty" : null,
                  onChanged: (value) => isCode == true ? meterID = int.parse(value) : username = value,
            )
          
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ListTile(leading: Icon(FontAwesomeIcons.exclamationTriangle, color: Color.fromRGBO(0, 126, 222, 1), size: 45,), title: Text("This username is already in use."),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Try Again"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        signUp(email, password, username, meterID).then((value) {
          print(value);
          if(value) {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => Leaderboard(username: username, meterId: meterID,)));
          } else {
            _showDialog();
          }
        });
        
      },
          child: Container(
        width: MediaQuery.of(context).size.width/2,
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
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color.fromRGBO(0, 187, 255, 1), Color.fromRGBO(0, 126, 222, 1)])),
        child: Text(
          'Register',
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
          style: TextStyle(
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

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailPass("Email Address"),
        _emailPass("Password", isPassword: true),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(children: <Widget>[
                          _title(),
                          SizedBox(height: 25,),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                          ),
                        ],)
                      
                    ]),
                    
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
                      children: <Widget>[
                        _top(),
                        Expanded
                        (child: ListView(children: <Widget>[
                        _emailPasswordWidget(),
                        _userMeterField("User Name"),
                        _userMeterField("Meter ID", isCode: true),
                        SizedBox(
                          height: 20,
                        ),
                        _submitButton(),],))
                        
                       
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