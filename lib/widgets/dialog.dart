import 'package:flutter/material.dart';

class DialogUtils {
  static void showErrorDialog(BuildContext context,
      {String title,
      String content,
      VoidCallback actionOk,
      String okText}) async {
    Future.delayed(
        Duration.zero,
        () => _baseOkCancelDialog(context,
            title: title,
            content: content,
            actionOk: actionOk,
            okText: okText));
  }

  static void showOkCancelDialog(BuildContext context,
      {String title,
      String content,
      VoidCallback actionOk,
      String okText,
      VoidCallback actionCancel,
      String cancelText}) {
    Future.delayed(
        Duration.zero,
        () => _baseOkCancelDialog(context,
            title: title,
            content: content,
            actionOk: actionOk,
            okText: okText,
            actionCancel: actionCancel,
            cancelText: cancelText));
  }

  static Future<void> _baseOkCancelDialog(BuildContext context,
      {String title,
      String content,
      VoidCallback actionOk,
      String okText,
      VoidCallback actionCancel,
      String cancelText}) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: title == null ? null : Text('$title', style: TextStyle(height: 2)),
            content: Text('$content', style: TextStyle(height: 2)),
            actions: [
              actionCancel != null
                  ? FlatButton(
                      child:
                          Text(cancelText == null ? 'မလုပ်တော့ပါ' : cancelText),
                      onPressed: () {
                        Navigator.pop(context);
                        actionCancel();
                      },
                    )
                  : Container(),
              actionOk != null
                  ? FlatButton(
                      child: Text(okText == null ? 'ဆက်လုပ်မည်' : okText),
                      onPressed: () {
                        Navigator.pop(context);
                        actionOk();
                      },
                    )
                  : Container()
            ],
          );
        });
  }
}
