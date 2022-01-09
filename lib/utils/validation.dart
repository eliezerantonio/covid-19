import 'package:covid_19_cases/ui/alert_dialog.dart';
import 'package:flutter/material.dart';

bool validateCrentials(String email, String password, BuildContext context) {
  if (!email.contains("@") || email.trim().isEmpty || email.length < 5) {
    alertDialog(context, "Informe email válido");
    return false;
  } else if (password.trim().isEmpty || password.length < 5) {
    alertDialog(context, "Informe password válida");
    return false;
  } else {
    return true;
  }
}
