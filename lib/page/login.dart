import 'package:flutter/material.dart';
import 'package:shaberunkun/function/my_widget.dart';
import 'package:shaberunkun/page/first_page.dart';
import '../function/func.dart';
import '../function/firebase_auth_error.dart';
import '../function/firebase_auth_login.dart';
import 'chat.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //文字をサーバーに送るために覚えておく変数
  final idController = TextEditingController();
  String _id = '';
  final passwordController = TextEditingController();
  String _password = '';

  //キーの保存用変数
  final _formIDKey = GlobalKey<FormState>();
  final _formPWKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン無効化
    return WillPopScope(
      onWillPop: () async {
        return await Func.movePage(context, FirstPage());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          width: double.infinity,
          //画面端の余白
          padding: MyWidget.paddingSize(),
          child: SingleChildScrollView(
            child: Column(
              //縦方向で真ん中
              mainAxisAlignment: MainAxisAlignment.center,
              //横方向で真ん中
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //idの入力フォーマット
                TextFormField(
                  controller: idController,
                  key: _formIDKey,
                  decoration: const InputDecoration(
                    hintText: 'please your mail-address',
                    labelText: 'Mail-Address',
                  ),
                ),
                //パスワードの入力フォーマット
                TextFormField(
                  controller: passwordController,
                  key: _formPWKey,
                  //伏字オン
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'please your password',
                    labelText: 'Password',
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    'Login',
                  ),
                  onPressed: () async {
                    //フォームの入力内容を代入
                    _id = idController.text;
                    _password = passwordController.text;
                    final FirebaseAuthResultStatus signInResult =
                    await FirebaseLogin.signInId(_id, _password);
                    if (signInResult != FirebaseAuthResultStatus.Successful) {
                      final errorMessage =
                      FirebaseAuthExceptionHandler.exceptionMessage(
                          signInResult);
                      FirebaseLogin.showErrorDialog(context, errorMessage);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('正常にログインしました。')));
                      await  Func.movePage(context, Chat());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}