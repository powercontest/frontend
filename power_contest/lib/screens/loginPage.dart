import 'package:flutter/material.dart';
import 'package:power_contest/screens/userMeter.dart';
import 'signupPage.dart';
import 'package:power_contest/screens/signupPage.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String tempEmail = "test@abc.com";
  String tempPassword = "12345";
  String email, password;
  //text controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passController = new TextEditingController();

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

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Color.fromRGBO(0, 187, 255, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  void dispose() {
      emailController.dispose();
      passController.dispose();
      super.dispose();
  }

  Widget _entryField(String title, {bool isPassword = false}) {
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

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: ListTile(leading: Icon(Icons.cancel, color: Color.fromRGBO(0, 126, 222, 1), size: 45,), title: Text("Invalid username or password."),),
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
        print(password);
        if (email == tempEmail && password == tempPassword) {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserMeter(email: email,)));
        } else {
          _showDialog();
        }
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
          'Login',
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
        _entryField("Email Address"),
        _entryField("Password", isPassword: true),
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
                            "Sign In",
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
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
      body: SingleChildScrollView(
              child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        _top(),
                        SizedBox(
                          height: 40,
                        ),
                        _emailPasswordWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        _submitButton(),
                        
                       
                      ],
                    ),
                  ),
                  Positioned(top: 40, left: 0, child: _backButton()),
                 Align(alignment: Alignment.bottomCenter, child: _createAccountLabel(),)
                ],
              ),
            ),
      )
        
      );
  }
}