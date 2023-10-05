import 'dart:convert';

import 'package:auth_firebase/api/auth_service.dart';
import 'package:auth_firebase/api/global_api.dart';
import 'package:auth_firebase/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _name = '';
  String _password = '';

  loginAccount() async {
    if (_name.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthService.login(_name, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Enter All Input');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0,
        title: new Text(
          'Login',
          style: TextStyle(fontSize: 20.0, color: Colors.deepOrange[600]),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              onChanged: (value) {
                _name = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => loginAccount(),
              child: new Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Icon(Icons.login, size: 30.0, color: Colors.white),
                  Text('Login'),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
