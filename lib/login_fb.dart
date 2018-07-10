import 'package:flutter/material.dart';
import 'package:login/home_page.dart';

class LoginFB extends StatefulWidget {
  static String tag = 'login-fb';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginFB> {
  @override
  Widget build(BuildContext context) {
    final logo = RendaFixa(
      tag: 'rendafixa',
      child: CircleAvatar (
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logook.png'),
      )
    );
  }
}

final loginButton = Padding (
  padding: EdgeInsets.symmetric(vertical: 16.0),
  child: Material(
    borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.lightBlueAccent.shade100,
    elevation: 5.0,
    child: MaterialButton(
      minWidth: 200.0,
      height: 42.0,
      onPressed: (){
        Navigator.of(context).pushNamed('home_page.dart');
      },
      color: Colors.lightBlueAccent,
      child: Text('Login', style: TextStyle(color: Colors.white),),
    ),
  ),
);