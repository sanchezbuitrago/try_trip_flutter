// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:try_trip/core/model/constants.dart';
import 'package:try_trip/core/widgets/alerts.dart';
import 'package:try_trip/core/widgets/buttons.dart';
import 'package:try_trip/core/widgets/text_form_fields.dart';
import 'package:try_trip/generated/l10n.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  SuccessAlert errorAlert = SuccessAlert();

  @override
  void initState() {
    super.initState();
  }

  void submit() {
    if (_formKey.currentState?.validate() ?? false) {
      print("Consumir servicio para enviar correo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            S.of(context).forgotPINTitle,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DefaultTextFormField(
                        controller: _emailController,
                        labelText: S.of(context).forgotPINFormEmail,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S
                                .of(context)
                                .forgotPINFormEmailNotFoundError;
                          }
                          // Validación simple para correo
                          if (!RegExp(emailRegex).hasMatch(value)) {
                            return S
                                .of(context)
                                .forgotPINFormEmailNotValidError;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: DefaultButtonNavigationBar(
                            onPressed: submit,
                            child: Text(S.of(context).forgotPINActionButton),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
