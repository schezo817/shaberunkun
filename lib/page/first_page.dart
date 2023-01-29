import 'package:flutter/material.dart';

import '../function/func.dart';
import 'login.dart';
import 'register.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.lightGreen,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "喋るんくん",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 45, right: 8, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Func.haveTextButton(context, Login(), 44.7, 325, "Login",
                      Colors.green, Colors.white),
                  Container(
                    height: 33.5,
                  ),
                  Func.haveTextButton(context, Register(), 44.7, 325, "Sign Up",
                      Colors.green, Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
