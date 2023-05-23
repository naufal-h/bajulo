import 'package:flutter/material.dart';

class CustomDialog {
  final BuildContext context;

  CustomDialog(this.context);

  Future<bool?> errorMessage({required String message}) {
    return _dialog(
      message: message,
      yesButtonText: "OK",
      yesButtonValue: false,
      noButtonText: '',
      icon: Icon(
        Icons.error_outline,
        size: 50,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }

  Future<bool?> confirmationDialog(
      {required String message, bool yesButtonHighlight = false}) {
    return _dialog(
      message: message,
      yesButtonText: "Yes",
      noButtonText: 'No',
      yesButtonColor: yesButtonHighlight == true
          ? Theme.of(context).colorScheme.error
          : null,
      icon: const Icon(Icons.question_mark, size: 50),
    );
  }

  Future<bool?> informationDialog({required String message}) {
    return _dialog(
      message: message,
      yesButtonText: "OK",
      noButtonText: '',
      icon: const Icon(Icons.info_outline, size: 50),
    );
  }

  Future<bool?> _dialog({
    required String message,
    required String yesButtonText,
    required String noButtonText,
    bool? yesButtonValue = true,
    Color? yesButtonColor,
    Icon? icon,
  }) {
    Color yesBtnColor = yesButtonColor ?? Theme.of(context).primaryColor;

    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Row(
          children: [
            icon ?? Container(),
            icon != null ? const SizedBox(width: 10) : Container(),
            Flexible(child: Text(message)),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(noButtonText),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(yesButtonValue),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(yesBtnColor)),
            child: Text(yesButtonText),
          )
        ],
      ),
    );
  }
}
