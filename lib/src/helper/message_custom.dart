import 'package:dictionary_app/utils/extension.dart';
import 'package:flutter/material.dart';


class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) => _showMessage(message, context.primaryColor);

  void showSuccess(String message) => _showMessage(message, context.secondaryColor);

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: context.textTheme.bodySmall!.copyWith(color: Colors.white)),
      backgroundColor: color,
    ));
  }

  
}
