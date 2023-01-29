import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Chatgpt {
  static Future<Response> getResponse(String message) async {
    final apiKey = dotenv.get("CHATGPT_APYKEY");
    final response = await Dio().post(
      "https://api.openai.com/v1/completions",
      data: {
        "model": "text-davinci-003",
        "prompt": message,
        "temperature": 1.0,
        "max_tokens": 1000,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.6,
        "stop": [" Human:", " AI:"]
      },
      options: Options(
        headers: {"Authorization": "Bearer ${apiKey}"},
      ),
    );
    return response;
  }
}
