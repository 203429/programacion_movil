import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/screens/welcome_user.dart';

Future<void> registerWithPassword(
    BuildContext context, fullName, email, password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((UserCredential userCredential) async => {
              await userCredential.user?.updateDisplayName(fullName),
              await userCredential.user?.updatePhotoURL('https://i.stack.imgur.com/l60Hf.png'),
              Navigator.pushReplacementNamed(context, '/login')
            });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Contraseña débil'),
            content: const Text(
                'La contraseña proporcionada es demasiado débil. Debe tener al menos 6 caracteres.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (e.code == 'email-already-in-use') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cuenta existente'),
            content: const Text(
                'Ya existe una cuenta registrada para este correo electrónico.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

Future<void> logInWithPassword(BuildContext context, email, password) async {
  try {
    late User? user;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) => {
              user = userCredential.user,
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelcomeUserWidgetEmail(user!)))
            });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
