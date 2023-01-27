import 'package:firebase_auth/firebase_auth.dart';

enum FirebaseAuthResultStatus {
  // ignore: constant_identifier_names
  Successful,
  // ignore: constant_identifier_names
  EmailAlreadyExists,
  // ignore: constant_identifier_names
  WrongPassword,
  // ignore: constant_identifier_names
  InvalidEmail,
  // ignore: constant_identifier_names
  UserNotFound,
  // ignore: constant_identifier_names
  UserDisabled,
  // ignore: constant_identifier_names
  OperationNotAllowed,
  // ignore: constant_identifier_names
  TooManyRequests,
  // ignore: constant_identifier_names
  Undefined,
}

class FirebaseAuthExceptionHandler {
  // ignore: prefer_typing_uninitialized_variables
  static var errorMessage;
  static FirebaseAuthResultStatus handleException(FirebaseAuthException e) {
    errorMessage  = e;
    FirebaseAuthResultStatus result;
    switch (e.code) {
      case 'invalid-email':
        result = FirebaseAuthResultStatus.InvalidEmail;
        break;
      case 'wrong-password':
        result = FirebaseAuthResultStatus.WrongPassword;
        break;
      case 'user-disabled':
        result = FirebaseAuthResultStatus.UserDisabled;
        break;
      case 'user-not-found':
        result = FirebaseAuthResultStatus.UserNotFound;
        break;
      case 'operation-not-allowed':
        result = FirebaseAuthResultStatus.OperationNotAllowed;
        break;
      case 'too-many-requests':
        result = FirebaseAuthResultStatus.TooManyRequests;
        break;
      case 'email-already-exists':
        result = FirebaseAuthResultStatus.EmailAlreadyExists;
        break;
      default:
        result = FirebaseAuthResultStatus.Undefined;
    }
    return result;
  }

  static String exceptionMessage(FirebaseAuthResultStatus result) {
    String? message = '';
    switch (result) {
      case FirebaseAuthResultStatus.Successful:
        message = 'ログインに成功しました。';
        break;
      case FirebaseAuthResultStatus.EmailAlreadyExists:
        message = '指定されたメールアドレスは既に使用されています。';
        break;
      case FirebaseAuthResultStatus.WrongPassword:
        message = 'パスワードが違います。';
        break;
      case FirebaseAuthResultStatus.InvalidEmail:
        message = 'メールアドレスが不正です。';
        break;
      case FirebaseAuthResultStatus.UserNotFound:
        message = '指定されたユーザーは存在しません。';
        break;
      case FirebaseAuthResultStatus.UserDisabled:
        message = '指定されたユーザーは無効です。';
        break;
      case FirebaseAuthResultStatus.OperationNotAllowed:
        message = '指定されたユーザーはこの操作を許可していません。';
        break;
      case FirebaseAuthResultStatus.TooManyRequests:
        message = '要求が多すぎます。';
        break;
      case FirebaseAuthResultStatus.Undefined:
        message = '不明なエラーが発生しました。'+errorMessage.code;
        break;
    }
    return message;
  }
}