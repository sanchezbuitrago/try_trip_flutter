// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:try_trip/core/widgets/alerts.dart';
import 'package:try_trip/core/widgets/buttons.dart';
import 'package:try_trip/core/widgets/text_form_fields.dart';

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
      print("Enviar correo");
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
                            "¿ Olvidaste tú PIN ?",
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
                        labelText: 'Correo electrónico',
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su correo electrónico';
                          }
                          // Validación simple para correo
                          if (!RegExp(
                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return 'Por favor ingrese un correo válido';
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
                            child: Text("Generar Nuevo PIN"),
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
