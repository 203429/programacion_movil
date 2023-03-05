import 'package:flutter/material.dart';
import 'package:my_first_app/services/auth_request.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isChecked = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Regístrate"),
            Image.asset(
              "assets/images/mini_logo.png",
              width: 70,
              height: 70,
            ),
          ],
        ),
        backgroundColor: const Color(0xff48197c),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            "Crea una cuenta para empezar a usar la app",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromARGB(255, 113, 113, 113),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Nombre",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: ('Nombre completo'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            "Correo eletrónico",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: ('Dirección de correo'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            "Contraseña",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextField(
                          controller: passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: ('Contraseña'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "La contraseña debe contener caracteres, números y símbolos con un mínimo de 6 caracteres.",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              shape: const CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: RichText(
                                text: TextSpan(
                                  text: "Al registrarme, acepto los ",
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: "términos y condiciones",
                                        style: TextStyle(color: Color(0xffe73f6a))),
                                    TextSpan(
                                        text: " y la "),
                                    TextSpan(
                                        text: "política de privacidad.",
                                        style: TextStyle(color: Color(0xffe73f6a))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: (RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )),
                                side: const BorderSide(
                                  width: 2,
                                  color: Colors.green,
                                ),
                              ),
                              child: const Text(
                                "Crear Cuenta",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                registerWithPassword(context, nameController.text, emailController.text, passController.text);
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("¿Ya tienes una cuenta?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text(
                                'Iniciar Sesión',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffe73f6a)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
