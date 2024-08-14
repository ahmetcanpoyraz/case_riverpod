import 'package:case_riverpod/core/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class AlertDialogHelper {
  static final AlertDialogHelper _instance = AlertDialogHelper._init();

  static AlertDialogHelper get instance => _instance;

  AlertDialogHelper._init();

  Future showAlertDialog(BuildContext context, String message) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomAlertDialog(
              error: message,
            ));
  }
}
