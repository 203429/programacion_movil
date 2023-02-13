import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Recuperar contraseña"),
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
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Por seguridad, tu contraseña debe contener una longitud de entre 8 y 15 caracteres,usar mayúsculas, minúsculas, contener por lo menos un número especial y un carácter especial.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromARGB(255, 113, 113, 113),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            "Nueva contraseña",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: ('Nueva contraseña'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            "Confirmar nueva contraseña",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintText: ('Confirmar nueva contraseña'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
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
                                "Actualizar contraseña",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
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