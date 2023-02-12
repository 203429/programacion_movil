import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/all4mypet_logo.png',
                  width: 250,
                  height: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: OutlinedButton.icon(
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff3f68ec),
                    minimumSize: const Size(double.infinity, 50),
                    shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Continuar con Google',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: OutlinedButton.icon(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff384e9f),
                    minimumSize: const Size(double.infinity, 50),
                    shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Continuar con Facebook',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: OutlinedButton.icon(
                  icon: const FaIcon(
                    FontAwesomeIcons.envelope,
                    color: Colors.grey,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xff65686e),
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xff65686e),
                    ),
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Registrarse con e-mail',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Entrar como invitado',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffe73f6a)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Entrar como vendedor',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff81a761)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("¿Ya tienes una cuenta?"),
                  TextButton(
                    onPressed: () {},
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
  }
}
