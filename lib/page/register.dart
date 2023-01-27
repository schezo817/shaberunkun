import 'package:flutter/material.dart';
import 'package:shaberunkun/function/my_widget.dart';
import 'package:shaberunkun/page/first_page.dart';

import '../function/func.dart';
import '../main.dart';
import 'chat.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //文字をサーバーに送るために覚えておく変数
  final idController = TextEditingController();
  String _id = '';
  final passwordController = TextEditingController();
  String _password = '';
  final rePasswordController = TextEditingController();
  String _rePassword = '';

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

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
          width: double.infinity,
          padding: MyWidget.paddingSize(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TextFormField(
                      controller: idController,
                      //入力可能キーボード
                      decoration: const InputDecoration(
                        hintText: 'please your e-mail',
                        labelText: 'Mail-Adress',
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'please make your password',
                        labelText: 'make Password',
                      ),
                    ),
                    TextFormField(
                      controller: rePasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'please enter your password again',
                        labelText: 'retype Password',
                      ),
                    ),
                  ],
                ),
                //登録完了ダイアログを表示する
                ElevatedButton(
                  child: Text(
                    'Send',
                  ),
                  onPressed: () async {
                    _id = idController.text;
                    _password = passwordController.text;
                    _rePassword = rePasswordController.text;
                    if (_id.contains('@') &&
                        _password != '' &&
                        _rePassword != '' &&
                        _password == _rePassword) {
                      try {
                        await auth.createUserWithEmailAndPassword(
                          email: _id,
                          password: _password,
                        );
                        await MyWidget.storage
                            .write(key: _id, value: _password);
                        await Func.movePage(context, Chat());
                      } catch (e) {
                        print(e.toString());
                      }
                    } else {
                      print("入力が不正です。");
                    }
                  },
                ),
                Func.haveTextButton(
                    context, FirstPage(), 44.7, 150, 'Return', Colors.grey, Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
