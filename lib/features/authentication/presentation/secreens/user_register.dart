import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:try_trip/core/widgets/drawer.dart';
import 'package:try_trip/core/widgets/buttons.dart';
import 'package:try_trip/core/widgets/text_form_fields.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _pinConfirmationController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _countryCode = '+57';
  bool _pinMatch = true;

  void submit() {
    if (_pinController.text == _pinConfirmationController.text) {
      setState(() {
        _pinMatch = true;
      });
      if (_formKey.currentState?.validate() ?? false) {
        // Si el formulario es válido, mostrar un mensaje
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registrando...')));
        // Aquí podrías manejar el registro, por ejemplo, enviando los datos a un servidor.
      }
    } else {
      setState(() {
        _pinMatch = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Registro de Usuario",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: const DefaultDrawer(),
      body: Column(
        children: [
          Expanded(child: Container(
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              // Hacer que el contenido sea desplazable
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          "Formulario de Registro",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // Nombre
                    DefaultTextFormField(
                      controller: _firstNameController,
                      labelText: "Nombre",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Apellidos
                    DefaultTextFormField(
                      controller: _lastNameController,
                      labelText: 'Apellidos',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese sus apellidos';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Correo electrónico
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
                    // Número de teléfono
                    Row(
                      children: [
                        IntrinsicWidth(
                          child: CountryCodePicker(
                            headerText: "Selecciona el país",
                            onChanged: (countryCode) {
                              setState(() {
                                _countryCode = countryCode.dialCode!;
                              });
                            },
                            initialSelection: 'CO',
                            // Código de país por defecto para Colombia
                            favorite: ['CO'],
                            showCountryOnly: false,
                            alignLeft: true,
                            padding: EdgeInsets.zero,
                            showFlag: true,
                            searchDecoration: InputDecoration(
                              labelText: 'Buscar país', // Traducido a español
                              hintText: 'Buscar...', // Traducido a español
                            ),
                            textStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                        Flexible(
                          child: DefaultTextFormField(
                            controller: _phoneController,
                            labelText: 'Número de teléfono',
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su número de teléfono';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // PIN de 4 dígitos
                    Row(
                      children: [
                        Flexible(
                          child: DefaultTextFormField(
                            controller: _pinController,
                            labelText: 'PIN',
                            textInputType: TextInputType.number,
                            maxLength: 4,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su PIN';
                              }
                              if (value.length != 4) {
                                return 'El PIN debe tener 4 dígitos';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: DefaultTextFormField(
                            controller: _pinConfirmationController,
                            labelText: 'Confirmar PIN',
                            textInputType: TextInputType.number,
                            maxLength: 4,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su PIN';
                              }
                              if (value.length != 4) {
                                return 'El PIN debe tener 4 dígitos';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          !_pinMatch ? 'Los PINs no coinciden' : '',
                          style: TextStyle(
                            color: Color(0xFFB00020),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: DefaultButtonNavigationBar(
        onPressed: submit,
        child: Text("Registrar Usuario"),
      ),
    );
  }
}
