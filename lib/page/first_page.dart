import 'package:flutter/material.dart';
import '../function/screen_size.dart';

import '../function/func.dart';
import 'chat.dart';

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
              color: Colors.green,
            ),
            Container(
              padding: const EdgeInsets.all(45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Func.haveTextButton(context, Chat(), 44.7, 325, "Login",
                      Colors.blue, Colors.white),
                  Container(
                    height: 33.5,
                  ),
                  Func.haveTextButton(context, Chat(), 44.7, 325, "Sign Up",
                      Colors.blue, Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
