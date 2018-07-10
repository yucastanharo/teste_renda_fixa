import 'login_fb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

 
void main() async {
  runApp(MyApp());

  Db db = new Db('mongodb://<dbuser>:<dbpassword>@ds125871.mlab.com:25871/teste_db');
  db.open().then((success){
    if(success) print('Conectado! ;)');
  });
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renda Fixa',
      home: Login_FB(),
    );
  }
}