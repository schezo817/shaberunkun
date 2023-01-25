import 'package:flutter/material.dart';

import '../function/func.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
