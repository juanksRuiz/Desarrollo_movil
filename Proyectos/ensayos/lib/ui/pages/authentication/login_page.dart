import 'package:ensayos/domain/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthenticationController controller = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("loginScaffold"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Agro a la mano", style: TextStyle(fontSize: 20)),
            ),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        key: Key('correoLogin'),
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Correo'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingrese su correo";
                          } else if (!value.contains('@')) {
                            return "ingrese una dirección de correo válida";
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        key: Key('contrasenaLogin'),
                        controller: this._passwordController,
                        decoration: InputDecoration(labelText: "Contraseña"),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingrese la contrasena";
                          } else if (value.length < 6) {
                            return "La contraseña debería tener más de 6 caracteres.";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Boton de inicio de sesion
                      ElevatedButton(
                          key: Key('loginSubmit'),
                          onPressed: () async {
                            // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                            FocusScope.of(context).requestFocus(FocusNode());
                            final form = _formKey.currentState;
                            form!.save();
                            if (form.validate()) {
                              var value = await controller.login(
                                  _emailController.text,
                                  _passwordController.text);
                              if (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('User ok')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('User problem')));
                              }
                            } else {
                              final snackBar = SnackBar(
                                content: Text('Validation nok'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text("Ingresar")),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
