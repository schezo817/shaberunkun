import 'package:flutter/material.dart';

import '../function/chatgpt.dart';
import '../function/func.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final messageController = TextEditingController();
  String _message = '';
  final _formMesKey = GlobalKey<FormState>();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Talk ChatGPT"),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.lightGreen,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 45, right: 8, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: messageController,
                          key: _formMesKey,
                          decoration: const InputDecoration(
                            hintText: 'please message',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.schedule_send_rounded),
                        onPressed: () async{
                          _message = messageController.text;
                          var data = await Chatgpt.getResponse(_message);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
