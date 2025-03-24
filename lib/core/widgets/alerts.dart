// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:quickalert/quickalert.dart';

class SuccessAlert {
  QuickAlert quickAlert = QuickAlert();
  QuickAlertType alertType = QuickAlertType.success;
  void show(BuildContext context, void Function() onConfirm) {
    QuickAlert.show(
        context: context,
        type: alertType,
        text: "Usuario registrado de manera exitosa.",
        confirmBtnText: "Continuar",
        backgroundColor: Theme.of(context).colorScheme.secondary,
        textColor: Theme.of(context).colorScheme.onSecondary,
        titleColor: Theme.of(context).colorScheme.onSecondary,
        confirmBtnColor: Theme.of(context).colorScheme.primary,
        confirmBtnTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        onConfirmBtnTap: onConfirm);
  }
}

class ErrorAlert {
  QuickAlert quickAlert = QuickAlert();
  QuickAlertType alertType = QuickAlertType.error;
  void show(
      {required BuildContext context,
      required String alertText,
      required void Function() onConfirm}) {
    QuickAlert.show(
        context: context,
        type: alertType,
        text: alertText,
        confirmBtnText: "Continuar",
        backgroundColor: Theme.of(context).colorScheme.secondary,
        textColor: Theme.of(context).colorScheme.onSecondary,
        titleColor: Theme.of(context).colorScheme.onSecondary,
        confirmBtnColor: Theme.of(context).colorScheme.primary,
        confirmBtnTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        onConfirmBtnTap: onConfirm);
  }
}
