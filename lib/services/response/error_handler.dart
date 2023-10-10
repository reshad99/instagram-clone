import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class ErrorHandler {
  static void showError(BuildContext context, ErrorResponse errorResponse) {
    String errorMessage = "";
    debugPrint('errorHandler error code: ${errorResponse.statusCode}');
    int valueKey = 0;

    if (errorResponse.statusCode == 422) {
      var fields = errorResponse.errors!.fields!;
      int lastKey = fields.length - 1;
      String space = "\n";
      fields.forEach((key, value) {

        if (lastKey == valueKey) {
          space = "";
        }

        if (value.isNotEmpty) {
          errorMessage += "${value[0]}$space";
        }

        valueKey++;
      });
    }

    // Flushbar'ı göster
    Flushbar(
      messageSize: 18,
      backgroundColor: Colors.redAccent,
      message: errorResponse.statusCode == 422
          ? errorMessage
          : errorResponse.message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
