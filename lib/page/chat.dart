import 'package:flutter/material.dart';

import '../function/func.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Use ChatGPT"),
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
