import 'package:auth_firebase/api/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: AuthService.logout,
              child: new Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Icon(Icons.login, size: 30.0, color: Colors.white),
                  Text('Logout'),
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
