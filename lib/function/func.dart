import 'package:flutter/material.dart';

class Func {
  //ページ遷移のための関数
  static Future movePage(BuildContext context, var pages) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pages,
      ),
    );
  }

  //文章を持つ遷移ボタン
  static SizedBox haveTextButton(BuildContext context, StatefulWidget page,
      double height, double width, String text, Color color, Color textColor) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const StadiumBorder(),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        onPressed: () async {
          await movePage(context, page);
        },
      ),
    );
  }
}
